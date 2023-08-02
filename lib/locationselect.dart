import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';

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
    _requestLocationPermission();
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
      appBar: AppBar(
        title: Text('Select Location'),
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
                  // Handle the selected location here, e.g., pass it back to the previous screen or save it to your database.
                  Navigator.pop(context,
                      selectedLocation); // Pop the location page and pass the selected location back to the previous screen.
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
}
