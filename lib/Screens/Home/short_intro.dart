import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utility/colors.dart';
import '../../Utility/strings.dart';

class ShortIntro extends StatelessWidget {
  const ShortIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hey, I am $name,',
                  style: GoogleFonts.inriaSerif(fontSize: 24, color: white),
                ),
                Text(
                  skilled,
                  style: GoogleFonts.abhayaLibre(fontSize: 70, color: white),
                ),
                SizedBox(
                    width: 720,
                    height: 160,
                    child: Text(
                      homeDes,
                      style:
                          GoogleFonts.inriaSerif(fontSize: 24, color: white),
                    )),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.05),

                border: Border.all(color: white.withOpacity(0.2)),
              ),
              child: CircleAvatar(
                radius: 189,
                backgroundImage: AssetImage('assets/images/hamza.jpg'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
