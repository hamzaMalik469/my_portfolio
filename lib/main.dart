import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/Screens/About/about.dart';
import 'package:my_portfolio/Screens/Home/home.dart';
import 'package:my_portfolio/Screens/Project/project.dart';
import 'package:url_strategy/url_strategy.dart';
import 'firebase_options.dart';

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      home: Home(),
      initialRoute: '/Home',
      getPages: [
        GetPage(name: '/Home', page: ()=> Home()),
        GetPage(name: '/Project', page: ()=> Project()),
        GetPage(name: '/About', page: ()=> About())


      ],
    );
  }
}
