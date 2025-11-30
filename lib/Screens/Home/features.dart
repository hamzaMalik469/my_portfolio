import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Utility/colors.dart';

/// Style constants for Features widget
class _FeatureStyles {
  static const double mobileBreakpoint = 600;
  static const double mobileIconSize = 48;
  static const double desktopIconSize = 64;
  static const double mobileFontSize = 18;
  static const double desktopFontSize = 24;
  static const double mobileSpacing = 6;
  static const double desktopSpacing = 10;
  static const double subIconRatio = 0.6;
  static const double padding = 12;
}

/// Data model for sub-features
class SubFeatureData {
  final String icon;
  final String label;

  const SubFeatureData({
    required this.icon,
    required this.label,
  });
}

class Features extends StatelessWidget {
  const Features({
    super.key,
    required this.mainIcon,
    required this.mainString,
    required this.subFeatures,
  });

  final String mainIcon;
  final String mainString;
  final List<SubFeatureData> subFeatures;

  // Alternative constructor for backward compatibility
  factory Features.legacy({
    Key? key,
    required String mainIcon,
    required String mainString,
    required String subIcon1,
    required String subIcon1String,
    String? subIcon2,
    String? subIcon2String,
  }) {
    final subFeatures = <SubFeatureData>[
      SubFeatureData(icon: subIcon1, label: subIcon1String),
    ];

    if (subIcon2 != null &&
        subIcon2.isNotEmpty &&
        subIcon2String != null &&
        subIcon2String.isNotEmpty) {
      subFeatures.add(SubFeatureData(icon: subIcon2, label: subIcon2String));
    }

    return Features(
      key: key,
      mainIcon: mainIcon,
      mainString: mainString,
      subFeatures: subFeatures,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < _FeatureStyles.mobileBreakpoint;

        final iconSize = isMobile
            ? _FeatureStyles.mobileIconSize
            : _FeatureStyles.desktopIconSize;
        final fontSize = isMobile
            ? _FeatureStyles.mobileFontSize
            : _FeatureStyles.desktopFontSize;
        final spacing = isMobile
            ? _FeatureStyles.mobileSpacing
            : _FeatureStyles.desktopSpacing;

        return Semantics(
          label: '$mainString feature',
          child: Padding(
            padding: const EdgeInsets.all(_FeatureStyles.padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Main Icon
                _buildMainIcon(iconSize),
                SizedBox(height: spacing),

                // Title
                _buildTitle(fontSize),
                SizedBox(height: spacing),

                // Sub Features
                ..._buildSubFeatures(iconSize, fontSize, spacing),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMainIcon(double iconSize) {
    return SizedBox(
      height: iconSize,
      child: Image.asset(
        mainIcon,
        fit: BoxFit.contain,
        semanticLabel: mainString,
        errorBuilder: (context, error, stackTrace) {
          return Icon(
            Icons.broken_image_outlined,
            size: iconSize,
            color: Colors.grey,
          );
        },
      ),
    );
  }

  Widget _buildTitle(double fontSize) {
    return Text(
      mainString,
      style: GoogleFonts.inriaSerif(
        fontSize: fontSize,
        color: white,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  List<Widget> _buildSubFeatures(
    double iconSize,
    double fontSize,
    double spacing,
  ) {
    final widgets = <Widget>[];

    for (int i = 0; i < subFeatures.length; i++) {
      if (i > 0) {
        widgets.add(SizedBox(height: spacing));
      }
      widgets.add(
        _buildSubFeature(
          subFeatures[i],
          iconSize,
          fontSize,
          spacing,
        ),
      );
    }

    return widgets;
  }

  Widget _buildSubFeature(
    SubFeatureData subFeature,
    double iconSize,
    double fontSize,
    double spacing,
  ) {
    final subIconSize = iconSize * _FeatureStyles.subIconRatio;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: subIconSize,
          height: subIconSize,
          child: Image.asset(
            subFeature.icon,
            fit: BoxFit.contain,
            semanticLabel: subFeature.label,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.broken_image_outlined,
                size: subIconSize,
                color: Colors.grey,
              );
            },
          ),
        ),
        SizedBox(width: spacing),
        Text(
          subFeature.label,
          style: GoogleFonts.inriaSerif(
            fontSize: fontSize,
            color: white,
          ),
        ),
      ],
    );
  }
}
