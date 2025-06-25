import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart'; // for kIsWeb
import 'package:url_launcher/url_launcher.dart';
import '../Utility/colors.dart';
import 'dart:html' as html;

import '../Utility/icons_strings.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key, required this.selectedPage});

  final String selectedPage;

  @override
  Widget build(BuildContext context) {

    void _launchURL(String url) async {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $url';
      }
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          // ✅ Desktop/Web layout
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Name Section
              Row(
                children: [
                  Text("Humza",
                      style:
                          GoogleFonts.islandMoments(color: red, fontSize: 70)),
                  const SizedBox(width: 5),
                  Text("Hussain",
                      style: GoogleFonts.islandMoments(
                          color: white, fontSize: 70)),
                ],
              ),

              // Nav Items
              Row(
                children: [
                  _navItem("Home", "/Home"),
                  _navItem("Projects", "/Projects"),
                  _navItem("About", "/About"),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          _launchURL('https://github.com/hamzaMalik469');
                        },
                        child: CircleAvatar(
                          backgroundColor: blue,
                          child: Image.asset(github),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _launchURL(
                              'https://www.linkedin.com/in/hamza-hussain-431132283?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=web');
                        },
                        child: CircleAvatar(
                          backgroundColor: blue,
                          child: Image.asset(linkedin),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _launchURL(
                              'https://wa.me/923009718469'); // Replace with your WhatsApp number
                        },
                        child: CircleAvatar(
                          backgroundColor: blue,
                          child: Image.asset(whatsapp),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (kIsWeb) {
                        // 👇 Safe use of html only for web
                        _openResumePDF();
                      } else {
                        // Optional: Show a snack bar for mobile
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text("Resume download works on web only")),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: white),
                    child: Text('Resume',
                        style: GoogleFonts.aladin(fontSize: 20, color: red)),
                  ),
                ],
              ),
            ],
          );
        } else {
          // ✅ Mobile/Tablet layout with Drawer button
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Name
              Row(
                children: [
                  Text("Humza",
                      style:
                          GoogleFonts.islandMoments(color: red, fontSize: 25)),
                  const SizedBox(width: 5),
                  Text("Hussain",
                      style: GoogleFonts.islandMoments(
                          color: white, fontSize: 25)),
                ],
              ),

              // Menu Icon for Drawer
              Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, color: white, size: 30),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget _navItem(String title, String route) {
    return TextButton(
      onPressed: selectedPage == title ? null : () => Get.toNamed(route),
      child: Text(
        title,
        style: GoogleFonts.inriaSerif(
          fontSize: 20,
          color: white,
          fontWeight:
              selectedPage == title ? FontWeight.bold : FontWeight.normal,
          decoration: selectedPage == title
              ? TextDecoration.underline
              : TextDecoration.none,
          decorationColor: white,
        ),
      ),
    );
  }

  // ✅ Web-only function to open resume
  void _openResumePDF() {
    // Only import html if you're running on web
    // ignore: avoid_web_libraries_in_flutter

    html.window.open('resume.pdf', '_blank');
  }
}
