// Custom widget for the content of the card
import 'package:flutter/material.dart';

class MyCardContents extends StatelessWidget {
  const MyCardContents({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15.0), // To give space between the container and the text
        Row(
          children: [
            const SizedBox(width: 15.0), // To give space between the container and the text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60.0, // Width of the container
                  height: 60.0, // Height of the container
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle, // Shape of the container
                    color: Colors.green, // Background color of the container
                  ),
                ),
                const SizedBox(height: 10.0), // To give space between the container and the text
                const SizedBox(
                  width: 150.0, // Width of the container
                  child: Text(
                    'Habit Name', // Text to be displayed
                    style: TextStyle(
                      fontSize: 22.0, // Font size of the text
                      fontWeight: FontWeight.bold, // Font weight of the text
                    ),
                    textAlign: TextAlign.left, // Alignement du texte
                  ),
                ),
                const SizedBox(height: 5.0), // To give space between the container and the text
                const SizedBox( // Pour limiter la largeur du texte
                  width: 150.0, // Width of the container
                  child: Text(  // !!! Il faudra fixer la taille limite du texte
                    'Habit Description pojpojpojpoze poinzeo', // Text to be displayed
                    style: TextStyle(
                      fontSize: 17.0, // Font size of the text
                      color: Colors.white, // Color of the text
                    ),
                    textAlign: TextAlign.left, // Alignement du texte
                  ),
                ),
              ],
            ),
            const Spacer(), // Pour pousser mon container a droite
            Container(
              width: 180.0, // Width of the container
              height: 170.0, // Height of the container
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white, // Border radius of the container
              )
            ),
            const SizedBox(width: 15.0), // To give space between the container and the text
          ],  
        ),
        const SizedBox(height: 10.0), // To give space between the container and the text
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            'Habit Description oijrfdorizejnf zopiejfoizejopijoij opijoijoi oijoij oijoij oijioj ii j i j j ij ij ij oiflk ofliejfpozedf eloifjmpezojfl dcolijedpofj,dz lzoejfmozj', // Text to be displayed
            style: TextStyle(
              fontSize: 15.0, // Font size of the text
              color: Colors.black, // Color of the text
            ),
          ),
        ),
        const SizedBox(height: 10.0), // To give space between the container and the text
      ],
    );
  }
}