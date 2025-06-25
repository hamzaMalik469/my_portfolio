import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/Utility/icons_strings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;
import '../Utility/colors.dart';

void _launchURL(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}

Drawer myDrawer = Drawer(
  backgroundColor: blue,
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      DrawerHeader(
          decoration: BoxDecoration(color: blue),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text("Humza",
                      style:
                          GoogleFonts.islandMoments(color: red, fontSize: 50)),
                  const SizedBox(width: 5),
                  Text("Hussain",
                      style: GoogleFonts.islandMoments(
                          color: white, fontSize: 50)),
                ],
              ),
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
              )
            ],
          )),
      ListTile(
        title: Text('Home', style: GoogleFonts.inriaSerif(color: white)),
        onTap: () => Get.toNamed("/Home"),
      ),
      ListTile(
        title: Text('Projects', style: GoogleFonts.inriaSerif(color: white)),
        onTap: () => Get.toNamed("/Projects"),
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
