// userHabit.dart

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:progress_version_alpha/Feed/dataTest/jsonString.dart';
import 'package:progress_version_alpha/Structure/myAppBar.dart';
import 'package:progress_version_alpha/Structure/myBottomNavigationBar.dart';
import 'package:progress_version_alpha/Structure/myFloatingActionButton.dart';
import 'package:progress_version_alpha/User/UserHabit/myUserCardContent.dart';

class MyUserHabit extends StatelessWidget {
  const MyUserHabit({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'User Habit', // Title of the user habit 
      debugShowCheckedModeBanner: false, // To remove debug banner activity
      home: MyUserHabitPage(),
    );
  }
}

class MyUserHabitPage extends StatelessWidget {
  const MyUserHabitPage({super.key});


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar("Mes Habitudes"), // Top bar
      body: MyUserHabitView(), // Page body
      bottomNavigationBar: MyBottomNavigationBar("UserHabit"), // Bottom bar
      floatingActionButton: MyFloatingActionButton(), // Floating button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // Position of the floating button
    );
  }
}

class MyUserHabitView extends StatelessWidget{
  const MyUserHabitView({super.key});
  
  @override
  Widget build(BuildContext context) {
    // Decode the JSON
    List<dynamic> jsonArray = jsonDecode(jsonString);

    return ListView.builder(
      itemCount: jsonArray.length, // Number of items in the list
      itemBuilder: (BuildContext context, int index) {
        // Pass each JSON object to MyCompletedHabit
        return MyHabit(key: UniqueKey(), jsonObject: jsonArray[index]);
      },
    );
  }
}

// Custom card for the personnal habit
class MyHabit extends StatelessWidget {

  final dynamic jsonObject;

  const MyHabit({super.key, required this.jsonObject});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40.0), // To give space between the containers
        // Container de la card
        MyUserCardContents(jsonObject: jsonObject), // Custom widget for the content of the card
      ],
    );
  }
}