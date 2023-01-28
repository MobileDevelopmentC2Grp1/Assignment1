import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slice of Life',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Slice of Life'),
    );
  }
}

class MenuList extends StatelessWidget {
  MenuList({super.key});

  final _foodItems = [
    Padding(
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

class FilterChipWidget extends StatefulWidget {
  final String label;

  const FilterChipWidget({super.key, required this.label});

  @override
  State<FilterChipWidget> createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  var _active = false;

  @override
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // set the current page of the screen to the menu page
  var _currentPage = 1;

  // contents of the different screen
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
          padding: EdgeInsets.only(bottom: 8.0),
          child: Icon(FontAwesomeIcons.fireFlameCurved)),
      Text("Rewards (Stay Tuned)"),
    ]),
    Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
      Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Icon(FontAwesomeIcons.solidUser)),
      Text("Profile (Stay Tuned)"),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: _pages.elementAt(_currentPage)),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[500],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Dialog()),
          );
        },
        child: const Icon(Icons.add_shopping_cart_rounded),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
