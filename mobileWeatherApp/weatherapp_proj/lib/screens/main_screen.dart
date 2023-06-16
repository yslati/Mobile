import 'package:flutter/material.dart';
import '../screens/currently.dart';
import '../screens/today.dart';
import '../screens/weekly.dart';
import '../utils/constants.dart';
import '../utils/storage.dart';
import '../utils/helpers.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.title});
  final String title;
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _searchController = TextEditingController();
  final PageController _pageController = PageController(initialPage: 0);
  String _searchText = "";
  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();
    AppPreferences.getLocation().then((value) {
      _searchController.text = value ?? '';
      _submitSearch();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onItemTapped(index) => setState(() {
        _selectedPage = index;
        _pageController.animateToPage(
          _selectedPage,
          duration: const Duration(milliseconds: 50),
          curve: Curves.bounceOut,
        );
      });

  void _submitSearch() => _searchController.text.trim().isNotEmpty
      ? setState(() {
          _searchText = _searchController.text.trim();
          _searchController.clear();
          AppPreferences.storeLocation(location: _searchText);
        })
      : null;

  @override
  Widget build(BuildContext context) {
    final pages = [
      Currently(search: _searchText),
      Today(search: _searchText),
      Weekly(search: _searchText),
    ];

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: titleGradient(),
        title: _title(),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onItemTapped,
        children: pages,
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: bottomNavigationBarItems,
      currentIndex: _selectedPage,
      backgroundColor: Colors.white,
      selectedFontSize: 15,
      selectedIconTheme: const IconThemeData(size: 28),
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      selectedItemColor: Colors.yellow.shade800,
      unselectedItemColor: Colors.blueAccent,
      elevation: 30,
      onTap: _onItemTapped,
    );
  }

  Widget _title() {
    return Row(
      children: <Widget>[
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: TextField(
              controller: _searchController,
              maxLength: 35,
              textCapitalization: TextCapitalization.words,
              onSubmitted: (val) {
                _submitSearch();
              },
              onTap: () => setState(() {
                _searchText = "";
              }),
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                counterText: '',
                hintText: 'Search location...',
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white70,
                ),
              ),
            ),
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
