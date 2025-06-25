import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/Common%20Widgets/drawer.dart';
import 'package:my_portfolio/Utility/icons_strings.dart';
import 'package:my_portfolio/Utility/strings.dart';
import 'package:my_portfolio/models/project_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Common Widgets/nav_bar.dart';
import '../../Utility/colors.dart';

class Project extends StatelessWidget {
  Project({super.key});

  final List<ProjectModel> projects = [
    // Your projects list remains unchanged...
    ProjectModel(
      pics: [
        'assets/images/home_service1.jpg',
        'assets/images/home_service2.jpg',
        'assets/images/home_service3.jpg',
        'assets/images/home_service4.jpg',
        'assets/images/home_service5.jpg',
        'assets/images/home_service6.jpg',
        'assets/images/home_service7.jpg',
        'assets/images/home_service8.jpg',
        'assets/images/home_service9.jpg',
        'assets/images/home_service10.jpg',
        'assets/images/home_service11.jpg',
        'assets/images/home_service12.jpg',
        'assets/images/home_service13.jpg',
        'assets/images/home_service14.jpg',
        'assets/images/home_service15.jpg',
      ],
      name: 'Home Service App',
      desc:
          'This mobile application connects customers with skilled workers for various home services such as plumbing, electrical work, cleaning, and more. Developed using Flutter with Firebase backend integration, the app features a role-based login system for customers and workers. Customers can browse service providers, send service requests, and track the request status. Workers can view, accept, or reject incoming requests. The app ensures smooth communication and efficient service delivery with real-time updates and a clean, intuitive UI.',
      sourceCode: 'https://github.com/hamzaMalik469/home_service_app',
    ),
    ProjectModel(
      pics: [
        'assets/images/iub1.jpg',
        'assets/images/iub2.jpg',
        'assets/images/iub3.jpg',
        'assets/images/iub4.jpg',
      ],
      name: 'University Transport Tracking App',
      desc:
          'This mobile application was developed to help students and staff of Islamia University of Bahawalpur (IUB) track university transport in real time. Built using Flutter and integrated with Firebase, the app allows users to view the live location of university buses  and route information.',
      sourceCode: 'https://github.com/hamzaMalik469/iub_transport_app',
    ),
    ProjectModel(
        pics: [
          "assets/images/meter1.jpg",
          "assets/images/meter2.jpg",
          "assets/images/meter3.jpg",
          "assets/images/meter4.jpg",
        ],
        name: "Electric Meter App",
        desc:
            "This app allows users to add and manage electric meters by storing details like meter name, number, billing date, and readings. Users can input the latest readings, and the app automatically calculates the consumed units. Built using Flutter with Firebase backend and Provider for state management, the app also supports deletion of readings and updates total consumption accordingly. It provides an efficient solution for monitoring electricity usage.",
        sourceCode: "https://github.com/hamzaMalik469/Meter-App/tree/master")
  ];

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;

    return Scaffold(
      drawer: myDrawer,
      backgroundColor: blue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NavBar(selectedPage: 'Projects'),
                const SizedBox(height: 20),
                Text(
                  projectName,
                  style: GoogleFonts.abhayaLibre(
                    fontSize: isMobile ? 25 : 70,
                    color: white,
                  ),
                ),
                const SizedBox(height: 30),
                ...projects.map((project) {
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 40),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: white.withOpacity(0.2)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 🔹 Title Row
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(image: AssetImage(bullet), width: 24),
                            const SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                project.name,
                                style: GoogleFonts.abhayaLibre(
                                  fontSize: isMobile ? 17 : 40,
                                  color: white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // 🔹 Description
                        Text(
                          project.desc,
                          style: GoogleFonts.inriaSerif(
                            fontSize: isMobile ? 8 : 18,
                            color: white,
                          ),
                          textAlign:
                              isMobile ? TextAlign.justify : TextAlign.start,
                        ),

                        const SizedBox(height: 24),

                        // 🔹 Images
                        SizedBox(
                          height: isMobile ? 200 : 258,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: project.pics.map((pic) {
                                return PicWidget(
                                  pics: project.pics,
                                  image: pic,
                                  width: isMobile ? 100 : 119,
                                  height: isMobile ? 200 : 258,
                                  index: pic.indexOf(pic),
                                );
                              }).toList(),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // 🔹 Source Code Link
                        if (project.sourceCode.isNotEmpty)
                          InkWell(
                            onTap: () => _launchURL(project.sourceCode),
                            child: Text(
                              'Source Code',
                              style: GoogleFonts.inriaSerif(
                                fontSize: isMobile ? 14 : 16,
                                color: Colors.blue[200],
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PicWidget extends StatelessWidget {
  const PicWidget({
    super.key,
    required this.image,
    required this.width,
    required this.height,
    required this.index,
    required this.pics,
  });

  final String image;
  final double width;
  final double height;
  final int index;
  final List<String> pics;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        decoration: BoxDecoration(
            color: white, borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: () {
            Get.toNamed('/Image', arguments: {
              'images': pics,
              'initialIndex': index,
            });
          },
          child: Image.asset(
            image,
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
