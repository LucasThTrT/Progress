import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  // PreferredSizeWidget is used to set the height of the AppBar
  @override
  Size get preferredSize => const Size.fromHeight(56.0); // Height of the AppBar

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: 
        const Text('Progress_v_alpha'), // Title of the AppBar
      centerTitle: true, // To center the title
      backgroundColor: Colors.white10, // Background color of the AppBar

      // Bouton a gauche
      // Sert a filtrer ce que je veux voir on non dans mon fil d'actualité
      leading: IconButton(
        icon: const Icon(Icons.settings), // Icon for menu
        onPressed: () {}, // Action to be performed on click
      ),

      // Bouton(s) a droite
      actions: <Widget>[
        // Si je veux rajouter une autre action
        /* IconButton(
          icon: Icon(Icons.search), // Icon for search
          onPressed: () {}, // Action to be performed on click
        ), */
        IconButton(
          icon: const Icon(Icons.filter_list), // Icon for see activity of your friends
          onPressed: () {}, // Action to be performed on click
        ),
      ],
    );
  }
}