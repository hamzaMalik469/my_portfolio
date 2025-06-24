import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;
import '../Utility/colors.dart';

Drawer myDrawer = Drawer(
  backgroundColor: blue,
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      DrawerHeader(
        decoration: BoxDecoration(color: red),
        child: Text(
          'Navigation',
          style: GoogleFonts.aladin(fontSize: 28, color: white),
        ),
      ),
      ListTile(
        title: Text('Home', style: GoogleFonts.inriaSerif(color: white)),
        onTap: () => Get.toNamed("/Home"),
      ),
      ListTile(
        title: Text('Project', style: GoogleFonts.inriaSerif(color: white)),
        onTap: () => Get.toNamed("/Project"),
      ),
      ListTile(
        title: Text('About', style: GoogleFonts.inriaSerif(color: white)),
        onTap: () => Get.toNamed("/About"),
      ),
      ListTile(
        title: Text('Resume', style: GoogleFonts.inriaSerif(color: white)),
        onTap: () {
          // resume logic
          if (kIsWeb) {
            // 👇 Safe use of html only for web
            _openResumePDF();
          } else {
            // Optional: Show a snackbar for mobile
          }
        },
      ),
    ],
  ),
);

void _openResumePDF() {
  // Only import html if you're running on web
  // ignore: avoid_web_libraries_in_flutter

  html.window.open('resume.pdf', '_blank');
}
