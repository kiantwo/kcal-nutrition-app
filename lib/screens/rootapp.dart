import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:kcal_nutrition_app/screens/favorites/favorites.dart';

class KcalApp extends StatefulWidget {
  const KcalApp({Key? key}) : super(key: key);

  @override
  _KcalAppState createState() => _KcalAppState();
}

class _KcalAppState extends State<KcalApp> {
  int _selectedIndex = 0;
  final List<String> _pageName = [
    "Home",
    "Search",
    "Camera",
    "Favorites",
    "User"
  ];

  static const List<Widget> _page = <Widget>[
    DefaultScreen(pageIcon: IconlyLight.home, pageName: 'Home'),
    DefaultScreen(pageIcon: IconlyLight.search, pageName: 'Search'),
    DefaultScreen(pageIcon: IconlyLight.camera, pageName: 'Camera'),
    Favorites(),
    DefaultScreen(pageIcon: IconlyLight.profile, pageName: 'User'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _page.elementAt(_selectedIndex),
      bottomNavigationBar: _buildNavBar(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 75.0,
      title: Text(
        _pageName[_selectedIndex],
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.0,
    );
  }

  Widget _buildNavBar() {
    return Container(
      height: 80.0,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: BottomNavigationBar(
        elevation: 0.0,
        currentIndex: _selectedIndex,
        unselectedItemColor: const Color(0xff888a87),
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 8.0,
        unselectedFontSize: 8.0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: _selectedIndex == 0
                  ? const Icon(IconlyBold.home, size: 30.0)
                  : const Icon(IconlyLight.home, size: 30.0),
              label: 'Home'),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? const Icon(IconlyBold.search, size: 30.0)
                : const Icon(IconlyLight.search, size: 30.0),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _selectedIndex == 2
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).primaryColor),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  IconlyBold.camera,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? const Icon(Icons.favorite_rounded, size: 35.0)
                : const Icon(Icons.favorite_outline_rounded, size: 35.0),
            label: 'Heart',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 4
                ? const Icon(IconlyBold.profile, size: 35.0)
                : const Icon(IconlyLight.profile, size: 35.0),
            label: 'User',
          ),
        ],
        onTap: _onItemTap,
      ),
    );
  }

  void _onItemTap(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }
}

class DefaultScreen extends StatelessWidget {
  const DefaultScreen(
      {Key? key, required this.pageIcon, required this.pageName})
      : super(key: key);
  final IconData pageIcon;
  final String pageName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 445.0,
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              pageIcon,
              size: 120.0,
              color: const Color(0xffe7e7e7),
            ),
            const SizedBox(height: 20.0),
            Text(
              pageName,
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
