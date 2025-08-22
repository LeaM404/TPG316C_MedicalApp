import 'package:flutter/material.dart';
import 'package:medical_app/pages/appointment.dart';
import 'package:medical_app/pages/login.dart';
import 'package:medical_app/pages/profile.dart';
import 'package:medical_app/pages/registration.dart';
import 'package:medical_app/pages/review.dart';
import 'package:medical_app/pages/mainpage.dart';

class RouteManager {
  static const String registrationPage = '/';
  static const String loginPage = '/loginPage';
  static const String mainPage = '/mainPage';
  static const String appointmentsPage = '/appointmentsPage';
  static const String profilePage = '/profilePage';
  static const String reviewPage = '/reviewPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case registrationPage:
        return MaterialPageRoute(
          builder: (context) => const RegistrationPage(),
        );

      case loginPage:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );

      case mainPage:
        return MaterialPageRoute(
          builder: (context) => MainPage(),
        );

      // case mainPage:
      //   return MaterialPageRoute(
      //     builder: (context) => const MainPage(),
      //   );

      case appointmentsPage:
        return MaterialPageRoute(
          builder: (context) => const AppointmentsPage(),
        );

      case reviewPage:
        return MaterialPageRoute(
          builder: (context) => const ReviewPage(),
        );

      case profilePage:
        return MaterialPageRoute(
          builder: (context) => const ProfilePage(),
        );

      //case profilePage:
      //  return MaterialPageRoute(
      //    builder: (context) => NotUnderstoodPage(
      //     userEmail: Provider.of<User>(context, listen: false).email,
      //     mainScreenModel:
      //         Provider.of<MainScreenModel>(context, listen: false),
      //    ),
      // );

      default:
        throw const FormatException('Route not found! Check routes again!');
    }
  }
}
