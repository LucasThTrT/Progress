import 'dart:convert';

import 'package:flutter/material.dart';

// Structure
import '../Structure/myAppBar.dart';
import '../Structure/myBottomNavigationBar.dart';
import '../Structure/myFloatingActionButton.dart';

// Card
import 'myCardContents.dart';

// JSON data
import 'dataTest/jsonString.dart';

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
      appBar: MyAppBar("Mon Feed"), // Bar du haut
      body: MyFeedView(),     // Corps de la page
      bottomNavigationBar: MyBottomNavigationBar("Feed"), // Bar du bas
      floatingActionButton: MyFloatingActionButton(), // Bouton flottant
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // Position du bouton flottant
    ); // Custom AppBar
  }
}

class MyFeedView extends StatelessWidget {
  const MyFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    // Decode the JSON
    List<dynamic> jsonArray = jsonDecode(jsonString);

    return ListView.builder(
      itemCount: jsonArray.length, // Number of items in the list
      itemBuilder: (BuildContext context, int index) {
        // Pass each JSON object to MyCompletedHabit
        return MyCompletedHabit(key: UniqueKey(), jsonObject: jsonArray[index]);
      },
    );
  }
}

// Custom widget for the card + a little space between the cards
class MyCompletedHabit extends StatelessWidget {

  final dynamic jsonObject;

  const MyCompletedHabit({super.key, required this.jsonObject});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40.0), // To give space between the containers
        // Container de la card
        MyCardContents(jsonObject: jsonObject), // Custom widget for the content of the card
      ],
    );
  }
}


