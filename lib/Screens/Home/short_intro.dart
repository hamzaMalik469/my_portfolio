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
        bool isMobile = constraints.maxWidth < 800;

        return Padding(
          padding: const EdgeInsets.all(32.0),
          child: isMobile
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image First (on Mobile)
              _buildImage(context, 120),
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
              fontSize: isMobile ? 18 : 24, color: white),
        ),
        Text(
          skilled,
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style:
          GoogleFonts.abhayaLibre(fontSize: isMobile ? 40 : 70, color: white),
        ),
        SizedBox(
          width: isMobile ? double.infinity : 720,
          child: Text(
            homeDes,
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
            style:
            GoogleFonts.inriaSerif(fontSize: isMobile ? 18 : 24, color: white),
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
        border: Border.all(color: white.withOpacity(0.2)),
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: const AssetImage('assets/images/hamza.jpg'),
      ),
    );
  }
}
