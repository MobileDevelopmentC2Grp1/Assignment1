import "package:flutter/material.dart";
import "order.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_shopping_cart_rounded),
        backgroundColor: Colors.purple[500],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Order()),
          );
        },
      ),
    );
  }
}
