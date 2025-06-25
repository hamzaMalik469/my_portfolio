import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  late PageController _pageController;
  late List<String> images;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    final args = Get.arguments ?? {};
    images = List<String>.from(args['images'] ?? []);
    currentIndex = args['initialIndex'] ?? 0;

    _pageController = PageController(initialPage: currentIndex);
  }

  void _goToPage(int index) {
    if (index >= 0 && index < images.length) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() => currentIndex = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return const Scaffold(
        body: Center(child: Text('No images to show')),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          GestureDetector(
            onVerticalDragUpdate: (details) {
              if (details.delta.dy > 10) Get.back();
            },
            child: PageView.builder(
              controller: _pageController,
              itemCount: images.length,
              onPageChanged: (index) {
                setState(() => currentIndex = index);
              },
              itemBuilder: (context, index) {
                return Center(
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
          ),

          // Back Button
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () => Get.back(),
            ),
          ),

          // Left Button
          if (currentIndex > 0)
            Positioned(
              left: 10,
              top: MediaQuery.of(context).size.height / 2 - 25,
              child: IconButton(
                icon: const Icon(Icons.chevron_left, color: Colors.white, size: 40),
                onPressed: () => _goToPage(currentIndex - 1),
              ),
            ),

          // Right Button
          if (currentIndex < images.length - 1)
            Positioned(
              right: 10,
              top: MediaQuery.of(context).size.height / 2 - 25,
              child: IconButton(
                icon: const Icon(Icons.chevron_right, color: Colors.white, size: 40),
                onPressed: () => _goToPage(currentIndex + 1),
              ),
            ),
        ],
      ),
    );
  }
}
