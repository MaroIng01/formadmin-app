import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ElegantButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final Color startColor;
  final Color endColor;

  const ElegantButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.onPressed,
    required this.startColor,
    required this.endColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [startColor, endColor],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(15.0), // Coins plus arrondis
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 5), // Ombre subtile vers le bas
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(15.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(icon, color: Colors.white, size: 22),
                    SizedBox(width: 15),
                    Text(
                      label,
                      style: GoogleFonts.lato( // Utilisation de la police Google Fonts
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.arrow_forward_ios, color: Colors.white.withOpacity(0.7), size: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}