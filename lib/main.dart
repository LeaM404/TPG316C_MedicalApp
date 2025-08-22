import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:medical_app/models/user.dart';
import 'package:medical_app/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp({Key? key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.purple.shade300,
        ),
      ),
      initialRoute: RouteManager.loginPage,
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => User()),
//         //     ChangeNotifierProvider(create: (_) => MainScreenModel()),
//       ],
//       child: MaterialApp(
//         title: 'Reflective App',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         initialRoute: RouteManager.registrationPage,
//         onGenerateRoute: RouteManager.generateRoute,
//       ),
//     );
//   }
// }
