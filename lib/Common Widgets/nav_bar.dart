import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/Screens/Home/home.dart';
import 'package:my_portfolio/Screens/Project/project.dart';
import 'package:get/get.dart';

import '../Screens/About/about.dart';
import '../Utility/colors.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key, required this.selectedPage});

  final String selectedPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Text("Humza",
                  style: GoogleFonts.islandMoments(color: red, fontSize: 70)),
              const SizedBox(
                width: 5,
              ),
              Text("Hussain",
                  style: GoogleFonts.islandMoments(color: white, fontSize: 70)),
            ],
          ),
        ),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                selectedPage == "Home" ? null : Get.to(() => Home());
              },
              child: Text(
                "Home",
                style: GoogleFonts.inriaSerif(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: selectedPage == 'Home'
                        ? FontWeight.bold
                        : FontWeight.normal,
                    decoration: selectedPage == 'Home'
                        ? TextDecoration.underline
                        : TextDecoration.none,
                    decorationColor: white),
              ),
            ),
            TextButton(
              onPressed: () {
                selectedPage == "Project" ? null : Get.to(() => Project());
              },
              child: Text("Project",
                  style: GoogleFonts.inriaSerif(
                      fontSize: 26,
                      color: white,
                      fontWeight: selectedPage == 'Project'
                          ? FontWeight.bold
                          : FontWeight.normal,
                      decoration: selectedPage == 'Project'
                          ? TextDecoration.underline
                          : TextDecoration.none,
                      decorationColor: white)),
            ),
            TextButton(
              onPressed: () =>
                  selectedPage == "About" ? null : Get.to(() => About()),
              child: Text("About",
                  style: GoogleFonts.inriaSerif(
                      fontSize: 26,
                      color: white,
                      fontWeight: selectedPage == 'About'
                          ? FontWeight.bold
                          : FontWeight.normal,
                      decoration: selectedPage == 'About'
                          ? TextDecoration.underline
                          : TextDecoration.none,
                      decorationColor: white)),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Resume', style: GoogleFonts.aladin(fontSize: 20, color: red),),
            ),
          ],
        )),
      ],
    );
  }
}
