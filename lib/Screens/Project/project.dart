import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/Common Widgets/drawer.dart';
import 'package:my_portfolio/Utility/icons_strings.dart';
import 'package:my_portfolio/Utility/strings.dart';
import 'package:my_portfolio/provider/project_provider.dart'; // ✅ Add provider
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Common Widgets/nav_bar.dart';
import '../../Utility/colors.dart';

class Project extends StatefulWidget {
  const Project({super.key});

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  @override
  void initState() {
    super.initState();
    // Fetch projects from Firestore
    Future.microtask(() =>
        Provider.of<ProjectProvider>(context, listen: false).fetchProjects());
  }

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
          child: Consumer<ProjectProvider>(
            builder: (context, provider, child) {
              if (provider.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (provider.projects.isEmpty) {
                return const Center(child: Text("No projects available"));
              }

              return SingleChildScrollView(
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

                    // 🔹 Render projects dynamically
                    ...provider.projects.map((project) {
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
                              textAlign: isMobile
                                  ? TextAlign.justify
                                  : TextAlign.start,
                            ),

                            const SizedBox(height: 24),

                            // 🔹 Images (from Firestore URLs)
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
                                      index: project.pics.indexOf(pic),
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
              );
            },
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
          child: Image.network(
            // ✅ changed to network image
            image,
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
