import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Pour une police moderne
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500), // Durée de l'animation de fondu
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward(); // Lance l'animation

    // Navigue vers l'écran d'accueil après un délai, légèrement après la fin de l'animation
    Timer(
      Duration(seconds: 3), // Durée totale du splash screen (animation + petit délai)
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Important pour libérer les ressources de l'animation
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fond blanc épuré
      body: Center(
        child: FadeTransition( // Widget pour l'animation de fondu
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Le logo avec une taille ajustée pour être "moyenne"
              Image.asset(
                'assets/images/logo.png', // Chemin de votre logo
                height: 120, // Hauteur ajustée (était probablement plus grand avant)
                width: 120, // Largeur pour maintenir les proportions
              ),
              SizedBox(height: 20),
              // Texte "Formadmin" avec une police moderne
              Text(
                'Bienvenue à Formadmin',
                style: GoogleFonts.lato(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1469A7), // Couleur du texte (bleu de votre charte)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}