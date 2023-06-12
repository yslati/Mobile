import 'package:flutter/material.dart';
import 'package:weatherapp_proj/screens/currently.dart';
import 'package:weatherapp_proj/screens/today.dart';
import 'package:weatherapp_proj/screens/weekly.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Weather'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _searchController = TextEditingController();
  final _bottomNavigationBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.sunny),
      label: "Currently",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.today),
      label: "Today",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.calendar_month),
      label: "Weekly",
    ),
  ];
  String _localisation = "";
  int _selectedPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue.shade400, Colors.blue.shade700],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
        ),
        title: _title(),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onItemTapped,
        children: [
          Currently(
            search: _localisation,
          ),
          Today(
            search: _localisation,
          ),
          Weekly(
            search: _localisation,
          ),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: _bottomNavigationBarItems,
      currentIndex: _selectedPage,
      backgroundColor: Colors.white,
      selectedFontSize: 15,
      selectedIconTheme: const IconThemeData(size: 28),
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      selectedItemColor: Colors.yellow.shade800,
      unselectedItemColor: Colors.blueAccent,
      elevation: 50,
      onTap: (index) {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 400),
          curve: Curves.ease,
        );
      },
    );
  }

  Widget _title() {
    return Row(
      children: <Widget>[
        const Icon(
          Icons.search,
          color: Colors.white70,
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (value) {
                setState(() {
                  _localisation = value;
                });
              },
              onTap: () {
                setState(() {
                  _localisation = "";
                  _searchController.clear();
                });
              },
              controller: _searchController,
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                hintText: 'Search location...',
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        const Text(
          "| ",
          style: TextStyle(
            fontWeight: FontWeight.w300,
            color: Colors.white70,
            fontSize: 40,
          ),
        ),
        const Icon(
          Icons.near_me,
          color: Colors.white70,
        ),
      ],
    );
  }
}
