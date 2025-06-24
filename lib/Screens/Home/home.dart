import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/Common%20Widgets/nav_bar.dart';
import 'package:my_portfolio/Screens/Home/features.dart';
import 'package:my_portfolio/Screens/Home/short_intro.dart';
import 'package:my_portfolio/Utility/colors.dart';
import 'package:my_portfolio/Utility/icons_strings.dart';
import 'package:my_portfolio/Utility/strings.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blue,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                NavBar(
                  selectedPage: 'Home',
                ),
                ShortIntro(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Features(
                      mainIcon: mobile,
                      mainString: "Mobile Application",
                      subIcon1: android,
                      subIcon1String: "Android",
                      subIcon2: ios,
                      subIcon2String: "IOS",
                    ),
                    Features(
                      mainIcon: desktop,
                      mainString: "Desktop Application",
                      subIcon1: window,
                      subIcon1String: "Windows",
                      subIcon2: linux,
                      subIcon2String: "Linux",
                    ),
                    Features(
                      mainIcon: web,
                      mainString: "Web Application",
                      subIcon1: website,
                      subIcon1String: "Website",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
