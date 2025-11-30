import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Utility/colors.dart';
import '../Utility/strings.dart';
import '../Utility/icons_strings.dart';
import '../models/about_model.dart';
import '../provider/about_provider.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key, required this.selectedPage});

  final String selectedPage;

  // ✅ Updated breakpoints
  static const double _desktopBreakpoint = 900; // Increased from 800
  static const double _tabletBreakpoint = 600;

  @override
  Widget build(BuildContext context) {
    return Consumer<AboutProvider>(
      builder: (context, provider, _) {
        if (provider.isLoading) {
          return _buildLoadingNavBar(context);
        }

        if (provider.about.isEmpty) {
          return _buildNavBarContent(context, null);
        }

        return _buildNavBarContent(context, provider.about.first);
      },
    );
  }

  Widget _buildLoadingNavBar(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ✅ FIX: Use Flexible to prevent overflow
              Flexible(
                child: _buildNameSection(constraints.maxWidth),
              ),
              const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNavBarContent(BuildContext context, AboutModel? about) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        // ✅ Three-tier responsive layout
        if (width > _desktopBreakpoint) {
          return _buildDesktopNavBar(context, about, width);
        } else if (width > _tabletBreakpoint) {
          return _buildTabletNavBar(context, about, width);
        } else {
          return _buildMobileNavBar(context, width);
        }
      },
    );
  }

  // ══════════════════════════════════════════════════════════════
  // DESKTOP LAYOUT (> 900px)
  // ══════════════════════════════════════════════════════════════
  Widget _buildDesktopNavBar(
      BuildContext context, AboutModel? about, double width) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ✅ FIX: Wrap in Flexible
          Flexible(
            flex: 2,
            child: _buildNameSection(width),
          ),

          // ✅ FIX: Wrap in Flexible
          Flexible(
            flex: 3,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildNavItems(),
                  const SizedBox(width: 12),
                  _buildSocialIcons(),
                  if (about != null) ...[
                    const SizedBox(width: 12),
                    _buildResumeButton(context, about.resumeUrl),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════
  // TABLET LAYOUT (600px - 900px)
  // ══════════════════════════════════════════════════════════════
  Widget _buildTabletNavBar(
      BuildContext context, AboutModel? about, double width) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Smaller name on tablet
          Flexible(
            child: _buildNameSection(width),
          ),

          // Compact nav items
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildCompactNavItems(),
                const SizedBox(width: 8),
                _buildSocialIcons(compact: true),
                if (about != null) ...[
                  const SizedBox(width: 8),
                  _buildCompactResumeButton(context, about.resumeUrl),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════
  // MOBILE LAYOUT (< 600px)
  // ══════════════════════════════════════════════════════════════
  Widget _buildMobileNavBar(BuildContext context, double width) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ✅ FIX: Flexible name section
          Flexible(
            child: _buildNameSection(width),
          ),

          // Menu button
          IconButton(
            icon: const Icon(Icons.menu, color: white, size: 28),
            onPressed: () => Scaffold.of(context).openDrawer(),
            tooltip: 'Open menu',
          ),
        ],
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════
  // REUSABLE COMPONENTS
  // ══════════════════════════════════════════════════════════════

  /// ✅ FIXED: Dynamic font size based on screen width
  Widget _buildNameSection(double screenWidth) {
    // Calculate responsive font size
    double fontSize;
    if (screenWidth > 900) {
      fontSize = 60; // Desktop
    } else if (screenWidth > 600) {
      fontSize = 40; // Tablet
    } else if (screenWidth > 400) {
      fontSize = 28; // Large mobile
    } else {
      fontSize = 22; // Small mobile
    }

    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            style: GoogleFonts.islandMoments(
              letterSpacing: screenWidth > 600 ? 2 : 1,
              color: red,
              fontSize: fontSize,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            "Hussain",
            style: GoogleFonts.islandMoments(
              color: white,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItems() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _navItem("Home", "/Home"),
        _navItem("Projects", "/Projects"),
        _navItem("About", "/About"),
      ],
    );
  }

  Widget _buildCompactNavItems() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _compactNavItem("Home", "/Home"),
        _compactNavItem("Projects", "/Projects"),
        _compactNavItem("About", "/About"),
      ],
    );
  }

  Widget _navItem(String title, String route) {
    final isSelected = selectedPage == title;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: TextButton(
        onPressed: isSelected ? null : () => Get.toNamed(route),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        child: Text(
          title,
          style: GoogleFonts.inriaSerif(
            fontSize: 18,
            color: white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            decoration:
                isSelected ? TextDecoration.underline : TextDecoration.none,
            decorationColor: white,
          ),
        ),
      ),
    );
  }

  Widget _compactNavItem(String title, String route) {
    final isSelected = selectedPage == title;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: TextButton(
        onPressed: isSelected ? null : () => Get.toNamed(route),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          minimumSize: Size.zero,
        ),
        child: Text(
          title,
          style: GoogleFonts.inriaSerif(
            fontSize: 14,
            color: white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            decoration:
                isSelected ? TextDecoration.underline : TextDecoration.none,
            decorationColor: white,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcons({bool compact = false}) {
    final double iconSize = compact ? 14 : 18;
    final double avatarRadius = compact ? 14 : 18;
    final double spacing = compact ? 4 : 8;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _socialIcon(
          icon: github,
          url: 'https://github.com/hamzaMalik469',
          tooltip: 'GitHub',
          iconSize: iconSize,
          avatarRadius: avatarRadius,
        ),
        SizedBox(width: spacing),
        _socialIcon(
          icon: linkedin,
          url: 'https://www.linkedin.com/in/hamza-hussain-431132283',
          tooltip: 'LinkedIn',
          iconSize: iconSize,
          avatarRadius: avatarRadius,
        ),
        SizedBox(width: spacing),
        _socialIcon(
          icon: whatsapp,
          url: 'https://wa.me/923009718469',
          tooltip: 'WhatsApp',
          iconSize: iconSize,
          avatarRadius: avatarRadius,
        ),
      ],
    );
  }

  Widget _socialIcon({
    required String icon,
    required String url,
    required String tooltip,
    double iconSize = 18,
    double avatarRadius = 18,
  }) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: () => _launchURL(url),
        borderRadius: BorderRadius.circular(avatarRadius),
        child: CircleAvatar(
          backgroundColor: blue,
          radius: avatarRadius,
          child: Padding(
            padding: EdgeInsets.all(avatarRadius * 0.3),
            child: Image.asset(
              icon,
              width: iconSize,
              height: iconSize,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.link, color: white, size: iconSize);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResumeButton(BuildContext context, String resumeUrl) {
    return ElevatedButton(
      onPressed: () => _handleResumePress(context, resumeUrl),
      style: ElevatedButton.styleFrom(
        backgroundColor: white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
      child: Text(
        'Resume',
        style: GoogleFonts.aladin(fontSize: 18, color: red),
      ),
    );
  }

  Widget _buildCompactResumeButton(BuildContext context, String resumeUrl) {
    return ElevatedButton(
      onPressed: () => _handleResumePress(context, resumeUrl),
      style: ElevatedButton.styleFrom(
        backgroundColor: white,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        minimumSize: Size.zero,
      ),
      child: Text(
        'CV',
        style: GoogleFonts.aladin(fontSize: 14, color: red),
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════
  // UTILITY METHODS
  // ══════════════════════════════════════════════════════════════

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
  }

  void _handleResumePress(BuildContext context, String resumeUrl) async {
    if (kIsWeb) {
      // ✅ Use url_launcher for web too (works on all platforms)
      final uri = Uri.parse(resumeUrl);
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication, // Opens in new tab on web
        );
      }
    } else {
      // Mobile/Desktop
      final uri = Uri.parse(resumeUrl);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Could not open resume")),
        );
      }
    }
  }
}
