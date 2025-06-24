import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
          title:  Text('Home', style: GoogleFonts.inriaSerif(color: white)),
          onTap: () => Get.toNamed("/Home"),
        ),
        ListTile(
          title: Text('Project',  style: GoogleFonts.inriaSerif(color: white)),
          onTap: () => Get.toNamed("/Project"),
        ),
        ListTile(
          title:  Text('About',  style: GoogleFonts.inriaSerif(color: white)),
          onTap: () => Get.toNamed("/About"),
        ),
        ListTile(
          title:  Text('Resume', style: GoogleFonts.inriaSerif(color: white)),
          onTap: () {
            // resume logic
          },
        ),
      ],
    ),
  );
