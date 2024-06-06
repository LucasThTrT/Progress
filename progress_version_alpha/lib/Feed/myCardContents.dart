// Custom widget for the content of the card
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
        borderRadius: BorderRadius.circular(10.0), // Border radius of the container
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
                            const SizedBox(
                              child: Text(
                                'Date', // Text to be displayed
                                style: TextStyle(
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
                    
                    // Habit Name
                    const SizedBox(
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
          const SizedBox(height: 15.0), // To give space between the container and the text
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