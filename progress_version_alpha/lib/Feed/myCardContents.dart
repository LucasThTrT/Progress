// Custom widget for the content of the card
// ignore_for_file: file_names

import 'package:flutter/material.dart';

// Services pour la couleur
import '../Services/getColorFromHex.dart';

// pour trouver l'image dans le fichier a supprimer dans le futur
// import 'dart:io';

class MyCardContents extends StatelessWidget {

  final dynamic jsonObject;
  
  const MyCardContents({super.key, required this.jsonObject});

  @override
  Widget build(BuildContext context) {
    Color? color = _getCardColor(jsonObject);

    return Container(
    // Taille de la card
      width: MediaQuery.of(context).size.width * 0.97, // Width set to 97% of the screen width
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0), // Border radius of the container
        // Use gradient if enabled, otherwise use single color

        // Couleur de la card
        color: color,
        gradient: color == null ? _getGradient(jsonObject) : null, // Gradient
      ),

      // Contenu de la card
      child: Column(
        children: [
          const SizedBox(height: 15.0), // To give space between the container and the text
          Row(
            children: [
              const SizedBox(width: 15.0), // To give space between the container and the text
              SizedBox(
                width: 170.0, // Width of the container
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                
                    // PROFIL DE L'UTILISATEUR
                    Row(
                      children: [
                        // Image de profil
                        Container(
                          width: 70.0, // Width of the container
                          height: 70.0, // Height of the container
                          decoration: BoxDecoration(
                            shape: BoxShape.circle, // Shape of the container
                            image: DecorationImage(
                              image: NetworkImage(jsonObject['profil']),
                              // Stockage de l'image locale
                              //image: FileImage(File('dataTest/img/user/user1.jpeg')), // Image URL
                              //fit: BoxFit.fill, // Fit the image within the container
                              fit: BoxFit.fitWidth, // Fit the image within the container
                            ),
                          ),
                        ),

                        const SizedBox(width: 7.0), // To give space between the container and the text
                        
                        // Informations de l'utilisateur
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5.0), // To give space between the container and the text
                            SizedBox(
                              child: Text(
                                jsonObject['user'], // Text to be displayed
                                style: const TextStyle(
                                  fontSize: 17.0, // Font size of the text
                                  fontWeight: FontWeight.bold, // Font weight of the text
                                ),
                                textAlign: TextAlign.left, // Alignement du texte
                              ),
                            ),
                
                            // Date de la publication
                            const SizedBox(height: 5.0), // To give space between the container and the text
                            SizedBox(
                              child: Text(
                                jsonObject['date'], // Text to be displayed
                                style: const TextStyle(
                                  fontSize: 15.0, // Font size of the text
                                  color: Colors.white, // Color of the text
                                ),
                                textAlign: TextAlign.left, // Alignement du texte
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  
                    const SizedBox(height: 10.0), // To give space between the container and the text
                    
                    // Habit Name = title
                    SizedBox(
                      child: Text(
                        jsonObject['habit'], // Text to be displayed
                        style: const TextStyle(
                          fontSize: 22.0, // Font size of the text
                          fontWeight: FontWeight.bold, // Font weight of the text
                        ),
                        textAlign: TextAlign.left, // Alignement du texte
                      ),
                    ),
                    const SizedBox(height: 5.0), // To give space between the container and the text
                    
                    
                    // Description principal
                    SizedBox( // Pour limiter la largeur du texte
                      width: 150.0, // Width of the container
                      height: 50,
                      // ! Il faudra fixer la taille limite du texte car je fixe une taille de champs
                      // ! de texte avec mon SizedBox (Question de design)
                      child: Text(  
                        jsonObject['description'], // Text to be displayed
                        style: const TextStyle(
                          fontSize: 17.0, // Font size of the text
                          color: Colors.white, // Color of the text
                        ),
                        textAlign: TextAlign.left, // Alignement du texte
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(), // Pour pousser mon container a droite

              // Image de l'habitude
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
          const SizedBox(height: 15.0), // To give space between the container and the text

          // Commentaire = Descritpiton secondaire
          // Si commentaire est vide, on ne l'affiche pas et on suppress l'espace

          jsonObject['comment'] == ""
              ? const SizedBox(height: 0.0)
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        jsonObject['comment'], // Text to be displayed
                        style: const TextStyle(
                          fontSize: 15.0, // Font size of the text
                          color: Colors.black, // Color of the text
                        ),
                      ),
                    ),
                    const SizedBox(
                        height:
                            15.0), // To give space between the container and the text
                  ],
                ),
        ],
      ),
    );
  }
  
  Color? _getCardColor(Map<String, dynamic> jsonObject) {
    bool useGradient = jsonObject['gradient'] == "1"; // Check if gradient is enabled

    if (useGradient) {
      return null; // Set color to null for gradient
    } else {
      return getColorFromHex(jsonObject["color1"]); // Use single color
    }
  }

  LinearGradient? _getGradient(Map<String, dynamic> jsonObject) {
    bool useGradient = jsonObject['gradient'] == "1"; // Check if gradient is enabled

    if (useGradient) {
      // Use gradient colors if "gradient" key is "1"
      Color color1 = getColorFromHex(jsonObject["color1"]);
      Color color2 = getColorFromHex(jsonObject["color2"]);
      return LinearGradient(
        colors: [color1, color2],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    } else {
      return null; // Return null if gradient is not enabled
    }
  }
}


// ? Version 2
// ? Mise en page des cards verticalement
/* 
class MyCardContents extends StatelessWidget {
  final dynamic jsonObject;

  const MyCardContents({super.key, required this.jsonObject});

  @override
  Widget build(BuildContext context) {
    Color? color = _getCardColor(jsonObject);

    return Container(
      // Taille de la card
      width: MediaQuery.of(context).size.width * 0.97, // Width set to 97% of the screen width
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), // Border radius of the container
        // Use gradient if enabled, otherwise use single color
        // Couleur de la card
        color: color,
        gradient: color == null ? _getGradient(jsonObject) : null, // Gradient
      ),

      // Contenu de la card
      child: Padding(
        padding: const EdgeInsets.all(15.0), // Added padding for consistent spacing
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PROFIL DE L'UTILISATEUR
            Row(
              children: [
                // Image de profil
                Container(
                  width: 60.0, // Width of the container
                  height: 60.0, // Height of the container
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Shape of the container
                    image: DecorationImage(
                      image: NetworkImage(jsonObject['profil']),
                      // Stockage de l'image locale
                      //image: FileImage(File('dataTest/img/user/user1.jpeg')), // Image URL
                      fit: BoxFit.fill, // Fit the image within the container
                    ),
                  ),
                ),
                const SizedBox(width: 10.0), // To give space between the container and the text

                // Informations de l'utilisateur
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      jsonObject['user'], // Text to be displayed
                      style: const TextStyle(
                        fontSize: 17.0, // Font size of the text
                        fontWeight: FontWeight.bold, // Font weight of the text
                      ),
                    ),
                    const SizedBox(height: 5.0), // To give space between the text and the date
                    Text(
                      jsonObject['date'], // Text to be displayed
                      style: const TextStyle(
                        fontSize: 15.0, // Font size of the text
                        color: Colors.white, // Color of the text
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15.0), // To give space between profile and habit name

            // Habit Name = title
            Text(
              jsonObject['habit'], // Text to be displayed
              style: const TextStyle(
                fontSize: 22.0, // Font size of the text
                fontWeight: FontWeight.bold, // Font weight of the text
              ),
            ),
            const SizedBox(height: 10.0), // To give space between the habit name and the description

            // Description principal
            Text(
              jsonObject['description'], // Text to be displayed
              style: const TextStyle(
                fontSize: 17.0, // Font size of the text
                color: Colors.white, // Color of the text
              ),
            ),
            const SizedBox(height: 15.0), // To give space between the description and the habit image

            // Image de l'habitude
            Container(
              width: 180.0, // Width of the container
              height: 170.0, // Height of the container
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white, // Border radius of the container
              ),
            ),
            const SizedBox(height: 15.0), // To give space between the habit image and the comment

            // Commentaire = Description secondaire
            // Si commentaire est vide, on ne l'affiche pas et on suppress l'espace
            if (jsonObject['comment'] != null && jsonObject['comment'].isNotEmpty)
              Text(
                jsonObject['comment'], // Text to be displayed
                style: const TextStyle(
                  fontSize: 15.0, // Font size of the text
                  color: Colors.black, // Color of the text
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color? _getCardColor(Map<String, dynamic> jsonObject) {
    bool useGradient = jsonObject['gradient'] == "1"; // Check if gradient is enabled

    if (useGradient) {
      return null; // Set color to null for gradient
    } else {
      return getColorFromHex(jsonObject["color1"]); // Use single color
    }
  }

  LinearGradient? _getGradient(Map<String, dynamic> jsonObject) {
    bool useGradient = jsonObject['gradient'] == "1"; // Check if gradient is enabled

    if (useGradient) {
      // Use gradient colors if "gradient" key is "1"
      Color color1 = getColorFromHex(jsonObject["color1"]);
      Color color2 = getColorFromHex(jsonObject["color2"]);
      return LinearGradient(
        colors: [color1, color2],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    } else {
      return null; // Return null if gradient is not enabled
    }
  }
}*/