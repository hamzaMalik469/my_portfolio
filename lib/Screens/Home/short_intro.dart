import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../Utility/colors.dart';
import '../../Utility/strings.dart';
import '../../models/about_model.dart';
import '../../provider/about_provider.dart';

class ShortIntro extends StatelessWidget {
  const ShortIntro({super.key});

  // Constants
  static const double _mobileBreakpoint = 600;
  static const double _contentMaxWidth = 720;

  @override
  Widget build(BuildContext context) {
    return Consumer<AboutProvider>(
      builder: (context, provider, _) {
        if (provider.isLoading) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(32),
              child: CircularProgressIndicator(color: white),
            ),
          );
        }

        if (provider.about.isEmpty) {
          return const Center(
            child: Text(
              "noAboutDataError",
              style: TextStyle(color: white),
            ),
          );
        }

        return _buildContent(provider.about.first);
      },
    );
  }

  Widget _buildContent(AboutModel about) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < _mobileBreakpoint;

        return Padding(
          padding: EdgeInsets.all(isMobile ? 10 : 32),
          child:
              isMobile ? _buildMobileLayout(about) : _buildDesktopLayout(about),
        );
      },
    );
  }

  Widget _buildMobileLayout(AboutModel about) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildImage(about.profileImage, radius: 70),
        const SizedBox(height: 24),
        _buildTextContent(about, isMobile: true),
      ],
    );
  }

  Widget _buildDesktopLayout(AboutModel about) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 2,
          child: _buildTextContent(about, isMobile: false),
        ),
        Expanded(
          child: _buildImage(about.profileImage, radius: 180),
        ),
      ],
    );
  }

  Widget _buildTextContent(AboutModel about, {required bool isMobile}) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Greeting
        Text(
          'Hey, I am $name,',
          style: GoogleFonts.inriaSerif(
            fontSize: isMobile ? 14 : 24, // Fixed: was 10
            color: white,
          ),
        ),

        // Profession Title
        Text(
          about.profession,
          style: GoogleFonts.abhayaLibre(
            letterSpacing: 2,
            fontSize: isMobile ? 35 : 70,
            color: white,
          ),
        ),

        // Summary
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: isMobile ? double.infinity : _contentMaxWidth,
          ),
          child: Text(
            about.professionSummary,
            textAlign: TextAlign.justify, // Fixed: removed redundant ternary
            style: GoogleFonts.inriaSerif(
              wordSpacing: 1,
              fontSize: isMobile ? 14 : 24,
              color: white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImage(String imageUrl, {required double radius}) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white10, // Use constant
          border: Border.all(width: 2, color: white),
          image: DecorationImage(
              image: NetworkImage(
                imageUrl,
              ),
              fit: BoxFit.cover)),
      // child: CircleAvatar(
      //   radius: radius,
      //   backgroundColor: Colors.grey[800],
      //   child: ClipOval(
      //     child: Image.network(
      //       imageUrl,
      //       fit: BoxFit.cover,
      //       width: radius * 2,
      //       height: radius * 2,
      //       loadingBuilder: (context, child, loadingProgress) {
      //         if (loadingProgress == null) return child;
      //         return SizedBox(
      //           width: radius * 2,
      //           height: radius * 2,
      //           child: const Center(
      //             child: CircularProgressIndicator(
      //               color: white,
      //               strokeWidth: 2,
      //             ),
      //           ),
      //         );
      //       },
      //       errorBuilder: (context, error, stackTrace) {
      //         return Icon(
      //           Icons.person,
      //           size: radius,
      //           color: white,
      //         );
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}
