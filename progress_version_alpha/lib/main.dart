import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Progress_v_alpha',  // Title of the app
      debugShowCheckedModeBanner: false, // To remove debug banner
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(), // Bar du haut
      body: MyFeed(),     // Corps de la page
      bottomNavigationBar: MyBottomNavigationBar(), // Bar du bas
      floatingActionButton: MyFloatingActionButton(), // Bouton flottant
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // Position du bouton flottant
    ); // Custom AppBar
  }
}

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

class MyFeed extends StatelessWidget {
  const MyFeed({super.key});

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

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        // Button pour le feed = Home
        BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'feed',
            ),

        // Button pour les publicatrions et liste de mes habitudes
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Mes habitudes',
            ),
          ],
      selectedItemColor: Colors.red,      // Color of the selected item
      unselectedItemColor: Colors.black,  // Color of the unselected item
      showSelectedLabels: false,            // To hide the selected label
      showUnselectedLabels: false,          // To hide the unselected label
      iconSize: 30.0,                       // Size of the icon
    );
  }
}


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
          height: 200.0, // Height of the container
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

// Custom widget for the content of the card
class MyCardContents extends StatelessWidget {
  const MyCardContents({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 15.0), // To give space between the container and the text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15.0), // To give space between the container and the text
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
                  fontSize: 20.0, // Font size of the text
                  fontWeight: FontWeight.bold, // Font weight of the text
                ),
              ),
            ),
            const SizedBox(height: 5.0), // To give space between the container and the text
            const SizedBox( // Pour limiter la largeur du texte
              width: 150.0, // Width of the container
              child: Text(  // !!! Il faudra fixer la taille limite du texte
                'Habit Description pojpojpojpoze poinzeo', // Text to be displayed
                style: TextStyle(
                  fontSize: 15.0, // Font size of the text
                  color: Colors.white, // Color of the text
                ),
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
        const SizedBox(width: 10.0), // To give space between the container and the text
      ],  
    );
  }
}
