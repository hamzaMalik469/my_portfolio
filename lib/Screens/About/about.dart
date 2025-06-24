import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/Utility/strings.dart';

import '../../Common Widgets/nav_bar.dart';
import '../../Utility/colors.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blue,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                NavBar(
                  selectedPage: 'About',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('About ',
                        style: GoogleFonts.abhayaLibre(
                            fontSize: 70, color: white)),
                    Text('ME. ',
                        style: GoogleFonts.aladin(fontSize: 70, color: red)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Container(
                    //   padding: EdgeInsets.all(20),
                    //   decoration: BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     color: Colors.white.withOpacity(0.05),
                    //     border: Border.all(color: white.withOpacity(0.2)),
                    //   ),
                    //   child: CircleAvatar(
                    //     radius: 100,
                    //     backgroundImage: AssetImage('assets/images/hamza.jpg'),
                    //   ),
                    // ),
                    SizedBox(
                      height: 29,
                    ),
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
                )
              ],
            ),
          ),
        )));
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            catagory,
            style: GoogleFonts.inriaSerif(
                fontSize: 48, color: white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            des,
            style: GoogleFonts.inriaSerif(
                fontSize: 28, color: white, fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
