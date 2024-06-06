import 'package:flutter/material.dart';

import '../Structure/myAppBar.dart';
import '../Structure/myBottomNavigationBar.dart';
import '../Structure/myFloatingActionButton.dart';
import 'myCardContents.dart';

class MyFeed extends StatelessWidget {
  const MyFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Progress_v_alpha',  // Title of the feed
      debugShowCheckedModeBanner: false, // To remove debug banner
      home: MyFeedPage(),
    );
  }
}

class MyFeedPage extends StatelessWidget {
  const MyFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(), // Bar du haut
      body: MyFeedView(),     // Corps de la page
      bottomNavigationBar: MyBottomNavigationBar(), // Bar du bas
      floatingActionButton: MyFloatingActionButton(), // Bouton flottant
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // Position du bouton flottant
    ); // Custom AppBar
  }
}

class MyFeedView extends StatelessWidget {
  const MyFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5, // Number of items in the list
      itemBuilder: (BuildContext context, int index) {
        return MyCompletedHabit(key: UniqueKey());
      },
    );
  }
}

// Custom widget for the card + a little space between the cards
class MyCompletedHabit extends StatelessWidget {
  const MyCompletedHabit({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container de la card
        Container(
          width: MediaQuery.of(context).size.width * 0.97, // Width set to 90% of the screen width
          // Height: on ne le défini pas car il s'adapte a la taille du contenu
          decoration: BoxDecoration(
            color: Colors.red, // Background color of the container
            borderRadius: BorderRadius.circular(10.0), // Border radius of the container
          ),
          child: const MyCardContents(), // Custom widget for the card
        ),
        const SizedBox(height: 10.0), // To give space between the containers
      ],
    );
  }
}


