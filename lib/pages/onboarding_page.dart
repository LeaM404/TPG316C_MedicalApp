import 'package:flutter/material.dart';
import 'package:medical_app/routes/routes.dart';
import 'package:medical_app/widgets/my_button.dart';
import 'package:medical_app/widgets/onboarding_items.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<OnboardingPage> {
  //Controller
  final PageController _pageController = PageController();

  //Last Page End
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              _pageController.jumpToPage(3);
            },
            child: const Text('Skip'),
          ),
        ],
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 3);
              });
            },
            children: const [
              OnboardingItem(
                image: 'lib/assets/images/Onboarding1.png',
                title: "",
                description: "welcome",
              ),
              OnboardingItem(
                image: 'lib/assets/images/Onboarding2.png',
                title: "Appointments",
                description: "Booking your appointments has never been easier!",
              ),
              OnboardingItem(
                image: 'lib/assets/images/Onboarding3.png',
                title: "Give Feedback",
                description: "welcome",
              ),
              OnboardingItem(
                image: 'lib/assets/images/Onboarding4.png',
                title: "Discover",
                description: "welcome",
              ),
            ],
          ),

          //Dot Indicators for Pages
          Container(
            alignment: const Alignment(0, 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Dot Indicators
                // SmoothPageIndicator(
                //   controller: _pageController,
                //   count: 4,
                //   effect: const ExpandingDotsEffect(
                //     dotWidth: 30,
                //     dotHeight: 5,
                //     radius: 5,
                //     dotColor: Color.fromARGB(103, 255, 255, 255),
                //     activeDotColor: Colors.black,
                //   ),
                // ),

                onLastPage
                    //Done
                    ? MyButton(
                        title: 'Get Started',
                        onTap: () {
                          Navigator.pushNamed(context, RouteManager.mainPage);
                        },
                        color: Colors.blue)

                    //Next Page
                    : GestureDetector(
                        onTap: () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: const Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.black,
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
