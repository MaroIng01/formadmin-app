import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/elegant_button.dart';

class HomeScreen extends StatelessWidget {
  final Color colorBleu = Color(0xFF1469A7);
  final Color colorVert = Color(0xFF2C8E67);

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $urlString';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey.shade100, Colors.grey.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 40.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png', height: 80),
                SizedBox(height: 60),

                ElegantButton(
                  label: 'Espace Formateur',
                  icon: FontAwesomeIcons.chalkboardUser,
                  startColor: colorBleu,
                  endColor: Color(0xFF1C82C1),
                  onPressed: () =>
                      _launchURL('https://formadmin.fr/formateur/login.html'),
                ),
                SizedBox(height: 25),

                ElegantButton(
                  label: 'Espace Client',
                  icon: FontAwesomeIcons.briefcase,
                  startColor: colorVert,
                  endColor: Color(0xFF38B080),
                  onPressed: () =>
                      _launchURL('https://formadmin.fr/admin/login.html'),
                ),
                SizedBox(height: 25),

                ElegantButton(
                  label: 'Espace Stagiaire',
                  icon: FontAwesomeIcons.userGraduate,
                  startColor: colorBleu,
                  endColor: Color(0xFF1C82C1),
                  onPressed: () =>
                      _launchURL('https://formadmin.fr/stagiaire/login.html'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
