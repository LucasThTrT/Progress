// userHabit.dart

import 'package:flutter/material.dart';

class MyUserHabit extends StatelessWidget {
  const MyUserHabit({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Progress_v_alpha',  // Title of the feed
      debugShowCheckedModeBanner: false, // To remove debug banner
      home: Text("Coucou c'est la page userHabit")
    );
  }
}