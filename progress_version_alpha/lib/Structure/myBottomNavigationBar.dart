// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {

  final String state;

  const MyBottomNavigationBar(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        // Button pour le feed = Home
        BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                // si on est sur la page feed, on met l'icone en rouge
                // sinon on la met en noir
                color: state == 'Feed' ? Colors.red : Colors.black,),
              label: 'feed',      
            ),  


        // Button pour les publicatrions et liste de mes habitudes
        BottomNavigationBarItem(
              icon: 
                Icon(
                  Icons.list,
                  color: state == 'UserHabit' ? Colors.red : Colors.black,),
              label: 'Mes habitudes',
            ),
          ],
          onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/feed');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/userHabit');
            break;
        }
      },
      showSelectedLabels: false,            // To hide the selected label
      showUnselectedLabels: false,          // To hide the unselected label
      iconSize: 30.0,                       // Size of the icon
    );
  }
}