import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/provider/about_provider.dart';
import 'package:provider/provider.dart';
import '../../Common Widgets/nav_bar.dart';
import '../../Common Widgets/drawer.dart';
import '../../Utility/colors.dart';
import '../../models/about_model.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AboutProvider>(context);

    if (provider.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (provider.about.isEmpty) {
      return const Scaffold(
        body: Center(child: Text("No about info available")),
      );
    }

    final AboutModel about = provider.about.first;
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;

    return Scaffold(
      drawer: myDrawer,
      backgroundColor: primaryColor,
      body: Container(
        decoration: const BoxDecoration(color: primaryColor),
        child: SafeArea(
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
                      Text("About ",
                          style: GoogleFonts.abhayaLibre(
                              fontSize: isMobile ? 36 : 70, color: white)),
                      Text("ME.",
                          style: GoogleFonts.aladin(
                              fontSize: isMobile ? 36 : 70, color: red)),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // 🔹 Contact Info
                  Column(
                    children: List.generate(about.contactList.length, (index) {
                      IconData icon;
                      switch (index) {
                        case 0:
                          icon = Icons.phone;
                          break;
                        case 1:
                          icon = Icons.email;
                          break;
                        case 2:
                          icon = Icons.home;
                          break;
                        default:
                          icon = Icons.contact_mail; // fallback
                      }

                      return ContactInfo(
                        isMobile: isMobile,
                        icon: icon,
                        text: about.contactList[index],
                      );
                    }),
                  ),

                  const SizedBox(height: 32),

                  // 🔹 Info Boxes
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AboutBox(
                          catagory: "Short Introduction",
                          des: about.shortIntro),
                      AboutBox(catagory: "Background", des: about.background),
                      AboutBox(
                        catagory: "Skills & Tech Stack",
                        des: "", // not used now
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: about.skills.map((skill) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("• ",
                                    style: GoogleFonts.inriaSerif(
                                        fontSize: isMobile ? 10 : 28,
                                        color: white),
                                    textAlign: isMobile
                                        ? TextAlign.justify
                                        : TextAlign.left), // bullet
                                Expanded(
                                  child: Text(
                                    skill,
                                    style: GoogleFonts.inriaSerif(
                                        fontSize: isMobile ? 10 : 28,
                                        color: white),
                                    textAlign: isMobile
                                        ? TextAlign.justify
                                        : TextAlign.left,
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  final bool isMobile;
  final IconData icon;
  final String text;

  const ContactInfo({
    super.key,
    required this.isMobile,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: white.withOpacity(0.7), size: isMobile ? 20 : 40),
        const SizedBox(width: 8),
        Text(text,
            style: GoogleFonts.inriaSerif(
                color: white, fontSize: isMobile ? 10 : 30)),
      ],
    );
  }
}

class AboutBox extends StatelessWidget {
  final String catagory;
  final String des;
  final Widget? child;

  const AboutBox(
      {super.key, required this.catagory, required this.des, this.child});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(catagory,
            style: GoogleFonts.inriaSerif(
                fontSize: isMobile ? 20 : 48,
                color: white,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        child ??
            Text(des,
                style: GoogleFonts.inriaSerif(
                    fontSize: isMobile ? 10 : 28, color: white),
                textAlign: isMobile ? TextAlign.justify : TextAlign.left),
        const SizedBox(height: 40),
      ],
    );
  }
}
