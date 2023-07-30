import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Badge.dart';
import 'CartNotifier.dart';
import 'homescreen2.dart';

class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem({required this.name, required this.price, required this.quantity});
}

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>
    with SingleTickerProviderStateMixin {
  final List<String> categoryButtons = [
    'Men',
    'Women',
    'Kids',
    'Bedroom',
    'Kitchen',
    'Delicate',
    'Dailywear',
  ];

  Map<String, List<String>> categoryItemsMap = {
    'Men': ['Men Item 1', 'Men Item 2', 'Men Item 3'],
    'Women': ['Women Item 1', 'Women Item 2', 'Women Item 3'],
    'Kids': ['Kids Item 1', 'Kids Item 2', 'Kids Item 3'],
    'Bedroom': ['Bedroom Item 1', 'Bedroom Item 2', 'Bedroom Item 3'],
    'Kitchen': ['Kitchen Item 1', 'Kitchen Item 2', 'Kitchen Item 3'],
    'Delicate': ['Delicate Item 1', 'Delicate Item 2', 'Delicate Item 3'],
    'Dailywear': ['Dailywear Item 1', 'Dailywear Item 2', 'Dailywear Item 3'],
  };

  Map<String, List<int>> categoryItemQuantitiesMap = {
    'Men': [0, 0, 0],
    'Women': [0, 0, 0],
    'Kids': [0, 0, 0],
    'Bedroom': [0, 0, 0],
    'Kitchen': [0, 0, 0],
    'Delicate': [0, 0, 0],
    'Dailywear': [0, 0, 0],
  };

  String selectedCategory = 'Men';
  String searchQuery = '';

  List<String> get filteredItems {
    final List<String>? items = categoryItemsMap[selectedCategory];
    if (items != null) {
      return items
          .where(
              (item) => item.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    }
    return [];
  }

  int _getTotalItems() {
    int totalItems = 0;
    final List<int>? quantities = categoryItemQuantitiesMap[selectedCategory];
    if (quantities != null) {
      totalItems = quantities.reduce((sum, value) => sum + value);
    }
    return totalItems;
  }

  double _getTotalCost() {
    double totalCost = 0;
    final List<String>? items = categoryItemsMap[selectedCategory];
    final List<int>? quantities = categoryItemQuantitiesMap[selectedCategory];
    if (items != null && quantities != null) {
      for (int i = 0; i < items.length; i++) {
        totalCost +=
            quantities[i] * 8.0; // Assuming cartItemPrice is always 8.0
      }
    }
    return totalCost;
  }

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleQuantityChange() {
    if (_getTotalItems() > 0) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  void _handleAddToList() {
    // Handle "Add to List" button press here
    // For example, update the cart state
    int totalQuantity = _getTotalItems();
    if (totalQuantity > 0) {
      final cartNotifier = Provider.of<CartNotifier>(context, listen: false);
      cartNotifier.addToCart(totalQuantity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Set the app bar color to white
        elevation: 0, // Set the elevation to 0 to remove the shadow
        iconTheme: IconThemeData(
          color: Colors.black, // Set the icon color to black
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press here
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => Homescreen()));
          },
        ),

        actions: [
          Consumer<CartNotifier>(
            builder: (context, cart, _) => Badge1(
              value: cart.totalItems
                  .toString(), // Use the totalItems from the CartNotifier
              // Customize the badge color if needed
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  // Handle cart button press here
                  // For example, navigate to a cart page
                },
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Happy Laundry',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width *
                    0.9, // Set width to 80% of screen width
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'images/laundaryimg2.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            TextField(
              onChanged: (query) {
                setState(() {
                  searchQuery = query;
                });
              },
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                height: 80,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (String category in categoryButtons)
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedCategory = category;
                                searchQuery =
                                    ''; // Reset search query when changing category
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              primary: selectedCategory == category
                                  ? Color(
                                      0xFF113BC1) // Set the selected color here
                                  : Color(
                                      0xFF2EC0F9), // Set the unselected color here
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(category),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  final cartItem = filteredItems[index];
                  final cartItemPrice = 8.0;
                  final cartItemQuantity =
                      categoryItemQuantitiesMap[selectedCategory]![index];
                  final imagePath =
                      'images/$selectedCategory/${cartItem.toLowerCase()}.jpg';
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Image.asset(
                          imagePath,
                          width: 150,
                          height: 150,
                        ),
                        title: Text(
                          cartItem,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    // Handle "Remove" button press here
                                    setState(() {
                                      if (cartItemQuantity > 0) {
                                        categoryItemQuantitiesMap[
                                            selectedCategory]![index]--;
                                        _handleQuantityChange();
                                      }
                                    });
                                  },
                                ),
                                Text('$cartItemQuantity'),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    // Handle "Add" button press here
                                    setState(() {
                                      categoryItemQuantitiesMap[
                                          selectedCategory]![index]++;
                                      _handleQuantityChange();
                                    });
                                  },
                                ),
                              ],
                            ),
                            Text(
                              '\$${cartItemPrice * cartItemQuantity}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            AnimatedSize(
              duration: Duration(milliseconds: 600),
              alignment: Alignment.topCenter,
              child: Container(
                height: (_getTotalItems() > 0
                    ? 70
                    : 0), // Subtract 30 pixels from the height
                padding: EdgeInsets.all(8.0),
                child: SlideTransition(
                  position: _slideAnimation,
                  child: SingleChildScrollView(
                    child: Column(
                      // Swapped Row to Column
                      children: [
                        Column(
                          // Swapped Column to Row
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // Center the items horizontally
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right:
                                          30.0), // Add padding between the texts
                                  child: Text(
                                    'Total Items',
                                    style: TextStyle(
                                      color: Color(
                                          0xFF8A8888), // Set the color to 0xFF8A8888
                                    ),
                                  ),
                                ),
                                Text(
                                  'Total Cost',
                                  style: TextStyle(
                                    color: Color(
                                        0xFF8A8888), // Set the color to 0xFF8A8888
                                  ),
                                ),
                                // Add the asset image here with appropriate path and dimensions
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // Center the items horizontally
                              children: [
                                Image.asset(
                                  'images/cart_image.png',
                                  width: 30,
                                  height: 30,
                                  // You can customize the width, height, and other properties as needed
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 30.0),
                                  child: Text(
                                    '${_getTotalItems()} items',
                                    style: TextStyle(
                                      fontSize:
                                          23, // Set the font size to 23 pixels
                                      fontWeight: FontWeight
                                          .bold, // Set the text to bold
                                    ),
                                  ),
                                ),
                                Text(
                                  '\$${_getTotalCost().toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize:
                                        23, // Set the font size to 23 pixels
                                    fontWeight:
                                        FontWeight.bold, // Set the text to bold
                                    // Set the color to 0xFF8A8888
                                  ),
                                ),
                                // Add another asset image here if needed
                              ],
                            ),
                          ],
                        ),
                        // Removed the "Total Amount" part
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.5, // 60% of the screen width
                  height: 50, // Set the desired height of the button
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15.0, left: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle "Buy Now" button press here
                        double totalAmount = _getTotalCost() * _getTotalItems();
                        // Process the purchase with the total amount
                      },
                      child: Text("Buy Now"),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Add some spacing between the buttons
                SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.4, // 40% of the screen width
                  height: 50, // Set the desired height of the button
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, bottom: 15.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors
                            .grey, // Set the button background color to grey
                      ),
                      onPressed: _handleAddToList,
                      child: Text("Add to List"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
