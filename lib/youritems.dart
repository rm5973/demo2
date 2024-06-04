import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CartNotifier.dart';

class YourItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartNotifier = Provider.of<CartNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Your Items',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartNotifier.cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = cartNotifier.cartItems[index];
                  return ListTile(
                    title: Text('${cartItem.category} ${cartItem.name}'),
                    subtitle: Text('Quantity: ${cartItem.quantity}'),
                    trailing: Text(
                        '\$${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}'),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Total Cost: \$${cartNotifier.totalCost.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
