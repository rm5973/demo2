import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'homescreen2.dart';

class LocationSelectionPage extends StatefulWidget {
  @override
  _LocationSelectionPageState createState() => _LocationSelectionPageState();
}

class _LocationSelectionPageState extends State<LocationSelectionPage> {
  GoogleMapController? mapController;
  LatLng? selectedLocation;
  String selectedAddress = "";

  @override
  void initState() {
    super.initState();
    _initializeFirebase();
    _requestLocationPermission();
  }

  // Initialize Firebase
  Future<void> _initializeFirebase() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      print("Firebase initialized");
    } catch (e) {
      print("Error initializing Firebase: $e");
    }
  }

  // Request location permissions
  Future<void> _requestLocationPermission() async {
    final PermissionStatus status = await Permission.location.request();
    if (status.isGranted) {
      print("Location permission granted");
      _getCurrentLocation();
    } else {
      print("Location permission denied");
    }
  }

  // Get current location
  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      LatLng currentLocation = LatLng(position.latitude, position.longitude);
      setState(() {
        selectedLocation = currentLocation;
      });

      // Move the camera to the current location
      mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(currentLocation, 16.0),
      );

      await _fetchAddressFromCoordinates(currentLocation);
    } catch (e) {
      print('Error getting current location: $e');
      setState(() {
        selectedAddress = "Error getting current location";
      });
    }
  }

  @override
  final pinIcon =
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Select Location'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) =>
                    Homescreen())); // Navigate back to the home screen
          },
        ),
      ),
      body: Stack(
        children: [
          if (selectedLocation != null)
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: selectedLocation!,
                zoom: 16.0,
              ),
              onMapCreated: (controller) {
                setState(() {
                  mapController = controller;
                });
              },
              onTap: (LatLng location) async {
                setState(() {
                  selectedLocation = location;
                  selectedAddress =
                      "Fetching address..."; // Show a temporary message while fetching the address
                });

                await _fetchAddressFromCoordinates(location);
              },
              markers: Set<Marker>.of([
                Marker(
                  markerId: MarkerId('selectedLocationMarker'),
                  position: selectedLocation!,
                  icon: pinIcon,
                  draggable: true,
                  onDragEnd: (newPosition) {
                    // Handle marker position change
                    setState(() {
                      selectedLocation = newPosition;
                    });

                    // Fetch the address for the new marker position
                    _fetchAddressFromCoordinates(newPosition);
                  },
                ),
              ]),
            ),
          if (selectedLocation != null)
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: ElevatedButton(
                onPressed: () {
                  _showAddressInputBottomSheet(selectedAddress);
                  //_uploadAddressToFirestore(selectedLocation!, selectedAddress);
                  // Navigator.pop(context, selectedLocation);
                },
                child: Text('Select this location'),
              ),
            ),
          if (selectedAddress.isNotEmpty)
            Positioned(
              bottom: 70,
              left: 16,
              right: 16,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(selectedAddress),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _fetchAddressFromCoordinates(LatLng location) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        setState(() {
          selectedAddress =
              "${placemark.name}, ${placemark.thoroughfare}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}";
        });
      }
    } catch (e) {
      print('Error fetching address: $e');
      setState(() {
        selectedAddress = "Error fetching address";
      });
    }
  }

  void _showAddressInputBottomSheet(String selectedAddress) {
    TextEditingController addressController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController postalCodeController = TextEditingController();

    // Set the selectedAddress as the initial value for cityController

    // Function to truncate city to a maximum of 55 characters
    String _truncateCity(String address) {
      if (address.length <= 55) {
        return address;
      } else {
        String truncatedCity = address.substring(0, 55);
        if (truncatedCity.endsWith(",")) {
          return truncatedCity;
        } else {
          int lastCommaIndex = truncatedCity.lastIndexOf(",");
          if (lastCommaIndex != -1) {
            return truncatedCity.substring(0, lastCommaIndex + 1);
          } else {
            // No comma found, return the original truncated string
            return truncatedCity;
          }
        }
      }
    }

    cityController.text = _truncateCity(selectedAddress);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Enter Complete Address",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    // Add a horizontal divider
                    thickness: 2,
                    color: Colors.grey,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 16),
                        TextField(
                          controller: addressController,
                          decoration: InputDecoration(
                            labelText: "Flat / House no / Floor / Building *",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: cityController,
                          decoration: InputDecoration(
                            labelText: "Area / Sector / Locality *",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: postalCodeController,
                          decoration: InputDecoration(
                            labelText: "Nearby landmark (optional)",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: cityController,
                          decoration: InputDecoration(
                            labelText: "Additional info",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.7,
                    child: ElevatedButton(
                      onPressed: () {
                        // Perform any actions with the entered addresses here.
                        String address = addressController.text;
                        String city = cityController.text;
                        String postalCode = postalCodeController.text;
                        String tot_address = address + city + postalCode;
                        _uploadAddressToFirestore(tot_address);
                        Navigator.pop(context); // Close the bottom sheet
                      },
                      child: Text("Save Addresses"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      backgroundColor: Colors.white.withOpacity(0.7),
    );
  }

  // Firebase Firestore reference
  final _firestore = FirebaseFirestore.instance;

  // Function to upload address to Firestore collection
  void _uploadAddressToFirestore(String address) async {
    try {
      // Check if the user is authenticated
      FirebaseAuth auth = FirebaseAuth.instance;
      User? user = auth.currentUser;

      if (user != null) {
        // Get the user's unique ID (UID)
        String userId = user.uid;

        // Define the data to be uploaded
        Map<String, dynamic> locationData = {
          'address': address,
        };

        // Check if the collection exists with the user's UID
        DocumentSnapshot<Map<String, dynamic>> userDoc =
            await _firestore.collection('users').doc(userId).get();

        if (!userDoc.exists) {
          // If the collection doesn't exist, create a new collection with the user's UID
          await _firestore.collection('users').doc(userId).set({});
        }

        // Check if the 'locations' collection exists under the user's collection
        DocumentSnapshot<Map<String, dynamic>> locationDoc = await _firestore
            .collection('users')
            .doc(userId)
            .collection('locations')
            .doc('NFcZto6jL0j69TBAAaAZ')
            .get();

        if (locationDoc.exists) {
          // If the document exists in 'locations' collection, update the data
          await _firestore
              .collection('users')
              .doc(userId)
              .collection('locations')
              .doc('NFcZto6jL0j69TBAAaAZ')
              .update(locationData);
        } else {
          // If the document doesn't exist in 'locations' collection, create a new document
          await _firestore
              .collection('users')
              .doc(userId)
              .collection('locations')
              .doc('NFcZto6jL0j69TBAAaAZ')
              .set(locationData);
        }
      } else {
        print('User is not authenticated. Cannot upload data to Firestore.');
      }
    } catch (e) {
      print('Error uploading address to Firestore: $e');
    }
  }
}
