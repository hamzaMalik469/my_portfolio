import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/Utility/strings.dart';
import 'package:my_portfolio/provider/about_provider.dart';
import 'package:provider/provider.dart';
import '../../Utility/colors.dart';
import '../../models/about_model.dart';

class ShortIntro extends StatelessWidget {
  const ShortIntro({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AboutProvider>(context);

    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.about.isEmpty) {
      return const Center(child: Text("No about data found"));
    }

    // Assuming only one "about" document
    final AboutModel about = provider.about.first;

    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;

        return Padding(
          padding: EdgeInsets.all(isMobile ? 10 : 32.0),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildImage(about.profileImage, isMobile ? 70 : 120),
                    const SizedBox(height: 24),
                    _buildTextContent(about, isMobile),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        flex: 2, child: _buildTextContent(about, isMobile)),
                    Expanded(child: _buildImage(about.profileImage, 180)),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildTextContent(AboutModel about, bool isMobile) {
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
          about.profession,
          style: GoogleFonts.abhayaLibre(
              fontSize: isMobile ? 20 : 70, color: white),
        ),
        SizedBox(
          width: isMobile ? double.infinity : 720,
          child: Text(
            about.professionSummary,
            textAlign: isMobile ? TextAlign.left : TextAlign.left,
            style: GoogleFonts.inriaSerif(
                fontSize: isMobile ? 6 : 24, color: white),
          ),
        ),
      ],
    );
  }

  Widget _buildImage(String imageUrl, double radius) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.05),
        border: Border.all(width: 2, color: white),
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: NetworkImage(imageUrl),
      ),
    );
  }
}
