import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart'; // for kIsWeb
import '../Utility/colors.dart';
import 'dart:html' as html;

class NavBar extends StatelessWidget {
  const NavBar({super.key, required this.selectedPage});

  final String selectedPage;

  @override
  Widget build(BuildContext context) {
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
                  _navItem("Project", "/Project"),
                  _navItem("About", "/About"),
                  ElevatedButton(
                    onPressed: () {
                      if (kIsWeb) {
                        // 👇 Safe use of html only for web
                        _openResumePDF();
                      } else {
                        // Optional: Show a snackbar for mobile
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
                          GoogleFonts.islandMoments(color: red, fontSize: 40)),
                  const SizedBox(width: 5),
                  Text("Hussain",
                      style: GoogleFonts.islandMoments(
                          color: white, fontSize: 40)),
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
