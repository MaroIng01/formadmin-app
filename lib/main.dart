import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Importer le package
import 'screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formadmin',
      theme: ThemeData(
        // Appliquer la police 'Lato' comme police par défaut
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
        // Vous pouvez garder une couleur primaire pour les éléments natifs comme la barre d'état
        primaryColor: Color(0xFF1469A7),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}