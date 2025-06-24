import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utility/colors.dart';
import '../../Utility/icons_strings.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // better alignment
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(mainIcon),
          fit: BoxFit.cover,
        ),
        SizedBox(height: 8),
        Text(
          mainString,
          style: GoogleFonts.inriaSerif(
            fontSize: 24,
            color: white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Image(image: AssetImage(subIcon1)),
            SizedBox(width: 8),
            Text(
              subIcon1String,
              style: GoogleFonts.inriaSerif(fontSize: 24, color: white),
            ),
          ],
        ),
        if (subIcon2 != null && subIcon2!.isNotEmpty) ...[
          SizedBox(height: 8),
          Row(
            children: [
              Image(image: AssetImage(subIcon2!)),
              SizedBox(width: 8),
              Text(
                subIcon2String ?? '',
                style: GoogleFonts.inriaSerif(fontSize: 24, color: white),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
