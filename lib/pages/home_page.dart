import 'package:flutter/material.dart';
import 'package:vacation_app_ui/misc/globals.dart';
import 'package:vacation_app_ui/models/location.dart';
import 'package:vacation_app_ui/pages/details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Vacation App UI",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () => currentTheme.switchTheme(),
              icon: Icon(
                currentTheme.isDark ? Icons.sunny : Icons.mode_night_rounded,
                color: Colors.white,
                size: 24,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailsPage(
              location: Location(images: [
                "images/places1.png",
                "images/places2.jpg",
                "images/places3.png",
                "images/places4.png",
                "images/places5.png",
              ]),
            ),
          )),
          child: const Text("View"),
        ),
      ),
    );
  }
}
