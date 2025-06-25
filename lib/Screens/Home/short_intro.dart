import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utility/colors.dart';
import '../../Utility/strings.dart';

class ShortIntro extends StatelessWidget {
  const ShortIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;
        double width= constraints.maxWidth;

        return Padding(
          padding:  EdgeInsets.all(isMobile? 10: 32.0),
          child: isMobile
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image First (on Mobile)
              _buildImage(context, isMobile? 70: 120),
              const SizedBox(height: 24),
              // Text below image
              _buildTextContent(isMobile),
            ],
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: _buildTextContent(isMobile),
              ),
              Expanded(
                child: _buildImage(context, 180),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTextContent(bool isMobile) {
    return Column(
      crossAxisAlignment:
      isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'Hey, I am $name,',
          style: GoogleFonts.inriaSerif(
              fontSize: isMobile ? 10 : 24, color: white),
        ),
        Text(
          skilled,
          textAlign:  TextAlign.left,
          style:
          GoogleFonts.abhayaLibre(fontSize: isMobile ? 20 : 70, color: white),
        ),
        SizedBox(
          width: isMobile ? double.infinity : 720,
          child: Text(
            homeDes,
            textAlign: isMobile ? TextAlign.left : TextAlign.left,
            style:
            GoogleFonts.inriaSerif(fontSize: isMobile ? 6 : 24, color: white),
          ),
        ),
      ],
    );
  }

  Widget _buildImage(BuildContext context, double radius) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.05),
        border: Border.all(
            width: 2,
            color: white),
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: const AssetImage('assets/images/hamza.jpg'),
      ),
    );
  }
}
