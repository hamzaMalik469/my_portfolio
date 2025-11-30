import 'package:flutter/material.dart';
import 'package:my_portfolio/Common%20Widgets/drawer.dart';
import 'package:my_portfolio/Common%20Widgets/nav_bar.dart';
import 'package:my_portfolio/Screens/Home/features.dart';
import 'package:my_portfolio/Screens/Home/short_intro.dart';
import 'package:my_portfolio/Utility/colors.dart';
import 'package:my_portfolio/Utility/icons_strings.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  // Define breakpoints
  static const double _desktopBreakpoint = 900;
  static const double _tabletBreakpoint = 600;

  // Feature data list
  static const List<Map<String, dynamic>> _featuresData = [
    {
      'mainIcon': mobile,
      'mainString': 'Mobile Application',
      'subIcon1': android,
      'subIcon1String': 'Android',
      'subIcon2': ios,
      'subIcon2String': 'IOS',
    },
    {
      'mainIcon': desktop,
      'mainString': 'Desktop Application',
      'subIcon1': window,
      'subIcon1String': 'Windows',
      'subIcon2': linux,
      'subIcon2String': 'Linux',
    },
    {
      'mainIcon': web,
      'mainString': 'Web Application',
      'subIcon1': website,
      'subIcon1String': 'Website',
      'subIcon2': website,
      'subIcon2String': 'Website',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer,
      body: Container(
        decoration: const BoxDecoration(color: primaryColor),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const NavBar(selectedPage: 'Home'),
              const ShortIntro(),
              _buildResponsiveFeatures(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResponsiveFeatures() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final features = _featuresData
            .map((data) => Features(
                  subFeatures: [
                    SubFeatureData(
                        icon: data['subIcon1'], label: data['subIcon1String']),
                    SubFeatureData(
                        icon: data['subIcon2'], label: data['subIcon2String'])
                  ],
                  mainIcon: data['mainIcon'],
                  mainString: data['mainString'],
                  // subIcon1: data['subIcon1'],
                  // subIcon1String: data['subIcon1String'],
                  // subIcon2: data['subIcon2'],
                  // subIcon2String: data['subIcon2String'],
                ))
            .toList();

        if (constraints.maxWidth > _desktopBreakpoint) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: features,
          );
        } else if (constraints.maxWidth > _tabletBreakpoint) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: features.take(2).toList(),
              ),
              const SizedBox(height: 16),
              features[2],
            ],
          );
        } else {
          return Column(
            children:
                features.expand((f) => [f, const SizedBox(height: 16)]).toList()
                  ..removeLast(),
          );
        }
      },
    );
  }
}
