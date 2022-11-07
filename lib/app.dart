import 'package:flutter/material.dart';
import 'package:vacation_app_ui/misc/globals.dart';
import 'package:vacation_app_ui/models/location.dart';
import 'package:vacation_app_ui/pages/details_page.dart';
import 'package:vacation_app_ui/pages/home_page.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vacation App UI',
      theme: currentTheme.lightTheme,
      darkTheme: currentTheme.darkTheme,
      themeMode: currentTheme.themeMode(),
      color: Colors.yellow,
      home: DetailsPage(
        location: Location(images: [
          "images/places1.png",
          "images/places2.jpg",
          "images/places3.png",
          "images/places4.png",
          "images/places5.png",
        ]),
      ),
    );
  }
}
