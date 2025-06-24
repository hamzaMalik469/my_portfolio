import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../Utility/colors.dart';

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
                      style: GoogleFonts.islandMoments(color: red, fontSize: 70)),
                  const SizedBox(width: 5),
                  Text("Hussain",
                      style: GoogleFonts.islandMoments(color: white, fontSize: 70)),
                ],
              ),

              // Nav Items
              Row(
                children: [
                  _navItem("Home", "/Home"),
                  _navItem("Project", "/Project"),
                  _navItem("About", "/About"),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: white),
                    child: Text('Resume',
                        style: GoogleFonts.aladin(fontSize: 20, color: red)),
                  ),
                ],
              ),
            ],
          );
        } else {
          // ✅ Mobile/Tablet layout with Drawer
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Name
              Row(
                children: [
                  Text("Humza",
                      style: GoogleFonts.islandMoments(color: red, fontSize: 40)),
                  const SizedBox(width: 5),
                  Text("Hussain",
                      style: GoogleFonts.islandMoments(color: white, fontSize: 40)),
                ],
              ),

              // Menu Icon
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
}
