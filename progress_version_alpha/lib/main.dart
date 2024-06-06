// main.dart
import 'package:flutter/material.dart';
import 'package:progress_version_alpha/Feed/feed.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/feed': (context) => const MyFeed(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToFeed();
  }

  _navigateToFeed() async {
    await Future.delayed(const Duration(seconds: 3), () {}); // Wait for 3 seconds
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/feed'); // Navigate to FeedScreen
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SpinKitCircle(
              color: Colors.blue,
              size: 100.0,
            ),
            SizedBox(height: 20),
            Text(
              "Je suis honnête, pour le moment ça ne sert à rien. Mais ça va permettre de faire la requête à l'API et de récupérer les données.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              )
            ),
          ],
        ),
      ),
    );
  }
}
