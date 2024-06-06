import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        // Button pour le feed = Home
        BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'feed',
            ),

        // Button pour les publicatrions et liste de mes habitudes
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Mes habitudes',
            ),
          ],
      selectedItemColor: Colors.red,      // Color of the selected item
      unselectedItemColor: Colors.black,  // Color of the unselected item
      showSelectedLabels: false,            // To hide the selected label
      showUnselectedLabels: false,          // To hide the unselected label
      iconSize: 30.0,                       // Size of the icon
    );
  }
}