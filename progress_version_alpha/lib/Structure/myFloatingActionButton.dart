import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval( // Permet d'avoir l'ombre du bouton flottant en forme de cercle
      child: Container(
        height: 55.0, // Height of the button
        width: 55.0, // Width of the button
        decoration: const BoxDecoration(
          shape: BoxShape.circle, // Shape of the button
          gradient: LinearGradient(
            colors: [
              Color(0xFF642b73),  // Code couleur: 642b73
              Color(0xFFc6426e),  // Code couleur: c6426e
            ],
          ),
        ),
        child: FloatingActionButton(
          onPressed: () {}, // Icon for the button
          backgroundColor: Colors.transparent, // Background color of the button
          elevation: 0.0, // Action to be performed on click
          child: const Icon(
            Icons.add,
            size: 36,
            color: Colors.white,), // Elevation of the button
        ),
      ),
    );
  }
}