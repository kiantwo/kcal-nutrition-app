import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

Widget buildNavBar(BuildContext context) {
  return Container(
    height: 80.0,
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: BottomNavigationBar(
      elevation: 0.0,
      currentIndex: 3,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Theme.of(context).primaryColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: [
        const BottomNavigationBarItem(
            icon: Icon(IconlyLight.home, size: 30.0), label: 'Home'),
        const BottomNavigationBarItem(
          icon: Icon(IconlyLight.search, size: 30.0),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Color(0Xff91c789)),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                IconlyBold.camera,
                size: 30.0,
                color: Colors.white,
              ),
            ),
          ),
          label: 'Camera',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.favorite_rounded, size: 35.0),
          label: 'Heart',
        ),
        const BottomNavigationBarItem(
          icon: Icon(IconlyLight.profile, size: 35.0),
          label: 'User',
        ),
      ],
    ),
  );
}
