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

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Heading
          Text(
            catagory,
            style: GoogleFonts.inriaSerif(
              fontSize: isMobile ? 28 : 48,
              color: white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          // 🔹 Description
          Text(
            des,
            style: GoogleFonts.inriaSerif(
              fontSize: isMobile ? 18 : 28,
              color: white,
            ),
            textAlign: isMobile ? TextAlign.justify : TextAlign.left,
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
