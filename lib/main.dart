import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dialog_box.dart';

void main() {
  // Entry point for the application
  runApp(const MyApp());
}

// MyApp stateless widget called from runApp()
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  // BuildContext locating e/ tracking each widget's position in the tree
  Widget build(BuildContext context) {
    return MaterialApp(
      /* MaterialApp wrapping a number of widgets*/
      title: 'Slice of Life',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Slice of Life'),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Class showing the list of food items as cards
class MenuList extends StatelessWidget {
  MenuList({super.key});

  final _foodItems = [
    Padding(
      // Layout widget to do with the space around the food items as well as the alignment of content on the App
      padding:
          const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0, bottom: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Wrap(
          alignment: WrapAlignment.start,
          spacing: 4.0,
          runSpacing: 2.0,
          children: const <Widget>[
            FilterChipWidget(label: 'Burgers'),
            FilterChipWidget(label: 'Pizzas'),
            FilterChipWidget(label: 'Combos'),
          ],
        ),
      ),
    ),
    Card(
      // For content and links with slight elevation on the sides
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            constraints: const BoxConstraints.expand(
              height: 200.0,
            ),
            decoration: BoxDecoration(
              color: Colors.purple[50],
            ),
            child: Image.asset(
              "images/image1.jpg",
              fit: BoxFit.cover,
            ),
          ),
          const ListTile(
            leading: Icon(
              FontAwesomeIcons.heart,
              color: Colors.purple,
            ),
            title: Text('My Cravings Box'),
            subtitle: Text("8.99 | 680-1690 Cal"),
          )
        ],
      ),
    ),
    Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            constraints: const BoxConstraints.expand(
              height: 200.0,
            ),
            decoration: BoxDecoration(
              color: Colors.purple[50],
            ),
            child: Image.asset(
              "images/image2.jpg",
              fit: BoxFit.cover,
            ),
          ),
          const ListTile(
            leading: Icon(
              FontAwesomeIcons.heart,
              color: Colors.purple,
            ),
            title: Text('Hawaiian Pizza'),
            subtitle: Text("4.99 | 680 Cal"),
          )
        ],
      ),
    ),
    Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            constraints: const BoxConstraints.expand(
              height: 200.0,
            ),
            decoration: BoxDecoration(
              color: Colors.purple[50],
            ),
            child: Image.asset(
              "images/image3.jpg",
              fit: BoxFit.cover,
            ),
          ),
          const ListTile(
            leading: Icon(
              FontAwesomeIcons.heart,
              color: Colors.purple,
            ),
            title: Text('Tower Burger'),
            subtitle: Text("3.99 | 680 Cal"),
          )
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      padding: const EdgeInsets.all(8),
      children: _foodItems,
    ));
  }
}

// Creating filter chips to allow filtering of the food items by type
class FilterChipWidget extends StatefulWidget {
  final String label;

  const FilterChipWidget({super.key, required this.label});

  @override
  State<FilterChipWidget> createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  var _active = false;

  @override
  // Showing action when the filter chip is selected.
  Widget build(BuildContext context) {
    return FilterChip(
        label: Text(widget.label),
        labelStyle: TextStyle(
            color: Colors.purple[400],
            fontSize: 16.0,
            fontWeight: FontWeight.bold),
        selected: _active,
        checkmarkColor: Colors.purple[400],
        onSelected: (active) {
          setState(() {
            _active = active;
          });
        },
        backgroundColor: Colors.purple[100],
        selectedColor: Colors.purple[100]);
  }
}

// Home page
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Setting the current page of the screen to the menu page
  var _currentPage = 1;

  // Contents of the different screens with layout widgets
  final _pages = [
    Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
      Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Icon(FontAwesomeIcons.house)),
      Text("Home (Stay Tuned)"),
    ]),
    Column(mainAxisAlignment: MainAxisAlignment.center, children: [MenuList()]),
    Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
      Padding(
          // Layout widget
          padding: EdgeInsets.only(bottom: 8.0),
          child: Icon(FontAwesomeIcons.fireFlameCurved)),
      Text("Rewards (Stay Tuned)"),
    ]),
    // Layout widget
    Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
      Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Icon(FontAwesomeIcons.solidUser)),
      Text("Profile (Stay Tuned)"),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                "My Order",
                style: TextStyle(
                  color: Colors.purple[500],
                  fontFamily: 'OpenSans',
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: const DialogBoxWidget(),
              contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
            ));
    return Scaffold(
      appBar: AppBar(
        // Taking the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: Drawer(
          // Drawer to allow navigation to different parts of the app
          child: Column(children: [
        const Padding(
          // Layout Widget
          padding: EdgeInsets.only(bottom: 8.0, top: 16.0),
          child: Text(
            "NEW",
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        Divider(
          // Adding a divider with padding to seperate items for better visualization
          color: Colors.purple[50],
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "ONLINE EXCLUSIVE",
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        Divider(
          color: Colors.purple[50],
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "COMBO",
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ])),
      body: Center(
          // Taking a single child and positions it in the middle of the parent.
          child: _pages.elementAt(_currentPage)),
      floatingActionButton: FloatingActionButton(
        // FAB for starting an order
        backgroundColor: Colors.purple[500],
        onPressed: () {
          openDialog();
        },
        child: const Icon(Icons.add_shopping_cart_rounded),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // Navigation to different pages of the app
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.bowlRice),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.fireFlameCurved),
            label: 'Rewards',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.solidUser),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentPage,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.purpleAccent,
        onTap: (int inIndex) {
          setState(() {
            _currentPage = inIndex;
          });
        },
      ),
    );
  }
}
