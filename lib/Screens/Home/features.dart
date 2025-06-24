import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utility/colors.dart';

class Features extends StatelessWidget {
  const Features({
    super.key,
    required this.mainIcon,
    required this.mainString,
    required this.subIcon1,
    required this.subIcon1String,
    this.subIcon2,
    this.subIcon2String,
  });

  final String mainIcon;
  final String mainString;
  final String subIcon1;
  final String subIcon1String;
  final String? subIcon2;
  final String? subIcon2String;

  @override
  Widget build(BuildContext context) {
    // Screen size
    double width = MediaQuery.of(context).size.width;

    // Dynamic sizes
    double iconSize = width < 600 ? 48 : 64;
    double fontSize = width < 600 ? 18 : 24;
    double spacing = width < 600 ? 6 : 10;

    return Padding(
      padding: const EdgeInsets.all(12.0), // add margin between cards
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Main Icon
          SizedBox(
            height: iconSize,
            child: Image.asset(mainIcon, fit: BoxFit.contain),
          ),
          SizedBox(height: spacing),
          // Title
          Text(
            mainString,
            style: GoogleFonts.inriaSerif(
              fontSize: fontSize,
              color: white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: spacing),
          // SubFeature 1
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: iconSize * 0.6,
                height: iconSize * 0.6,
                child: Image.asset(subIcon1, fit: BoxFit.contain),
              ),
              SizedBox(width: spacing),
              Text(
                subIcon1String,
                style: GoogleFonts.inriaSerif(
                  fontSize: fontSize,
                  color: white,
                ),
              ),
            ],
          ),

          // SubFeature 2 (optional)
          if (subIcon2 != null && subIcon2!.isNotEmpty) ...[
            SizedBox(height: spacing),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: iconSize * 0.6,
                  height: iconSize * 0.6,
                  child: Image.asset(subIcon2!, fit: BoxFit.contain),
                ),
                SizedBox(width: spacing),
                Text(
                  subIcon2String ?? '',
                  style: GoogleFonts.inriaSerif(
                    fontSize: fontSize,
                    color: white,
                  ),
                ),
              ],
            ),
          ],

        ],
      ),
    );
  }
}
