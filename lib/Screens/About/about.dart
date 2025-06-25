import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/Common%20Widgets/drawer.dart';
import 'package:my_portfolio/Utility/strings.dart';

import '../../Common Widgets/nav_bar.dart';
import '../../Utility/colors.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;

    return Scaffold(
      drawer: myDrawer,
      backgroundColor: blue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                NavBar(selectedPage: 'About'),
                const SizedBox(height: 24),

                // 🔹 Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'About ',
                      style: GoogleFonts.abhayaLibre(
                        fontSize: isMobile ? 36 : 70,
                        color: white,
                      ),
                    ),
                    Text(
                      'ME. ',
                      style: GoogleFonts.aladin(
                        fontSize: isMobile ? 36 : 70,
                        color: red,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ContactInfo(
                      isMobile: isMobile,
                      icon: Icons.phone,
                      text: phone,
                    ),
                    ContactInfo(
                      isMobile: isMobile,
                      icon: Icons.email,
                      text: email,
                    ),
                    ContactInfo(
                      isMobile: isMobile,
                      icon: Icons.location_city,
                      text: address,
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // 🔹 Info Boxes
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    AboutBox(
                      catagory: "Short Introduction",
                      des: sIntroDes,
                    ),
                    AboutBox(
                      catagory: "Background",
                      des: bDes,
                    ),
                    AboutBox(
                      catagory: "Skills & Tech Stack",
                      des: skills,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  const ContactInfo({
    super.key,
    required this.isMobile,
    required this.icon,
    required this.text,
  });

  final bool isMobile;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: white.withOpacity(0.7),
          size: isMobile ? 20 : 40,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          text,
          style: GoogleFonts.inriaSerif(
              color: white, fontSize: isMobile ? 10 : 30),
        ),
      ],
    );
  }
}

class AboutBox extends StatelessWidget {
  const AboutBox({
    super.key,
    required this.catagory,
    required this.des,
  });

  final String catagory;
  final String des;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔹 Heading
        Text(
          catagory,
          style: GoogleFonts.inriaSerif(
            fontSize: isMobile ? 20 : 48,
            color: white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),

        // 🔹 Description
        Text(
          des,
          style: GoogleFonts.inriaSerif(
            fontSize: isMobile ? 10 : 28,
            color: white,
          ),
          textAlign: isMobile ? TextAlign.justify : TextAlign.left,
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
