// ignore_for_file: sized_box_for_whitespace

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:medical_app/pages/appointment.dart';
import 'package:medical_app/pages/profile.dart';
import 'package:medical_app/pages/review.dart';
import 'package:scaled_list/scaled_list.dart';
import 'package:scroll_page_view/pager/page_controller.dart';
import 'package:scroll_page_view/pager/scroll_page_view.dart';
import 'package:scroll_page_view/scroll_page.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Scaled List Demo'),
          backgroundColor: Colors.blue,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Implement sign out functionality here
          },
          child: const Icon(Icons.logout_rounded),
          backgroundColor: Colors.blue,
        ),
        body: Builder(
          builder: (BuildContext context) {
            // Use Builder to get a new BuildContext
            return Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  'Welcome ',
                  style: GoogleFonts.montserrat(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 164,
                  child: ScrollPageView(
                    controller: ScrollPageController(),
                    children:
                        _images.map((image) => _imageView(image)).toList(),
                    onPageChanged: (index) {
                      _currentPageController.add(index);
                    },
                  ),
                ),
                const SizedBox(height: 25),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'How can we help you? ',
                        style: GoogleFonts.montserrat(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        child: ScaledList(
                          itemCount: categories.length,
                          itemColor: (index) {
                            return kMixedColors[index % kMixedColors.length];
                          },
                          itemBuilder: (index, selectedIndex) {
                            final category = categories[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context, // Use the context provided by the Builder widget
                                  MaterialPageRoute(
                                    builder: (context) => category.destination,
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: selectedIndex == index ? 80 : 60,
                                    child: Icon(
                                      category.iconData,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    category.name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          selectedIndex == index ? 25 : 20,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _imageView(String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(image, fit: BoxFit.cover),
      ),
    );
  }

  final StreamController<int> _currentPageController =
      StreamController<int>.broadcast();
  Stream<int> get _currentPageStream => _currentPageController.stream;

  final List<String> _images = [
    'assets/images/docters.jpg', // Local image path
    'assets/images/nice.jpg', // Local image path
  ];
}

final List<Color> kMixedColors = [
  const Color(0xff71A5D7),
  const Color(0xff72CCD4),
  const Color(0xffFBAB57),
  const Color(0xffF8B993),
  const Color(0xff962D17),
  const Color(0xffc657fb),
  const Color(0xfffb8457),
];

final List<Category> categories = [
  Category(
    iconData: Icons.assignment_add,
    name: "Appointments",
    destination: const AppointmentsPage(),
  ),
  Category(
    iconData: Icons.person,
    name: "My Profile",
    destination: const ProfilePage(),
  ),
  Category(
    iconData: Icons.border_color_outlined,
    name: "Review",
    destination: const ReviewPage(),
  ),
];

class Category {
  final IconData iconData;
  final String name;
  final Widget destination;

  Category({
    required this.iconData,
    required this.name,
    required this.destination,
  });
}
