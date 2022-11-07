import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vacation_app_ui/models/location.dart';
import 'package:vacation_app_ui/widgets/header_text.dart';
import 'package:vacation_app_ui/widgets/subtitle_text.dart';

class DetailsPage extends StatefulWidget {
  final Location location;
  const DetailsPage({required this.location, super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late List<String> images;
  late String selectedImage;

  @override
  void initState() {
    super.initState();
    images = widget.location.images;
    selectedImage = images[0];
  }

  updateImage(String image) {
    setState(() {
      selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //TOP SECTION
          Expanded(
            child: SizedBox(
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(selectedImage),
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
                child: Stack(
                  children: [
                    //ForeGround
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // TOP BUTTONS
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: IconButton(
                                  padding: const EdgeInsets.all(3),
                                  color: Colors.white,
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_back_rounded,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 4, right: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: IconButton(
                                      padding: const EdgeInsets.all(3),
                                      color: Colors.white,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.share_rounded,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 4, right: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: IconButton(
                                      padding: const EdgeInsets.all(3),
                                      color: Colors.white,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.favorite_border_rounded,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),

                        // IMAGES
                        ClipRect(
                          clipBehavior: Clip.antiAlias,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 0.5,
                              sigmaY: 0.5,
                              //tileMode: TileMode.mirror,
                            ),
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                              width: double.maxFinite,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: SingleChildScrollView(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                      widget.location.images.length, (index) {
                                    if (selectedImage ==
                                        widget.location.images
                                            .elementAt(index)) {
                                      return Container();
                                    }
                                    return ImageTab(
                                      imagePath: widget.location.images
                                          .elementAt(index),
                                      onPressed: () {
                                        updateImage(
                                          widget.location.images
                                              .elementAt(index),
                                        );
                                      },
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          //BOTTOM SECTION
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 14, 10, 5),
              //color: Colors.green,
              child: Column(
                children: [
                  // HEADER
                  Container(
                    //color: Colors.purple,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              HeaderText("Nigeria"),
                              SubText("A Beautiful Spring in Ogun State"),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            HeaderText("30,000 NGN"),
                            SubText("per person"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // DIVIDER
                  Container(
                    width: double.maxFinite,
                    height: 1.8,
                    color: Theme.of(context).textTheme.displaySmall!.color,
                  ),
                  // DESCRIPTION
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.location_on_rounded,
                              size: 20,
                              color: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .color,
                            ),
                            title: const HeaderText(
                              "Somewhere in Nigeria",
                              fontWeight: FontWeight.w600,
                              size: 22,
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.access_time_rounded,
                              size: 20,
                              color: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .color,
                            ),
                            title: const SubText(
                              "OPEN",
                              size: 16,
                            ),
                            subtitle: const HeaderText(
                              "9:00 AM",
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // FOOTER
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade900,
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(80),
                        right: Radius.circular(80),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              //horizontal: 8,
                              vertical: 8,
                            ),
                            child: HeaderText(
                              "Book Now",
                              size: 26,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 24,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageTab extends StatelessWidget {
  final String imagePath;
  final Function() onPressed;
  const ImageTab({required this.imagePath, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(left: 12, right: 12),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.red,
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
