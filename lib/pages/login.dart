import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Our App Logo
              Lottie.network(
                'https://lottie.host/5ec219b1-7b0f-4332-8c33-a36c7f4a23cc/SNEDm7jbWI.json',
                height: 400,
              ),
              //Welcome Message
              const Text(
                'Welcome Back!',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 36,
                ),
              ),

              //App Title
              const Text(
                'Hospital Management System',
                style: TextStyle(
                  color: Color.fromARGB(255, 6, 86, 151),
                  fontSize: 24,
                ),
              ),

              const SizedBox(
                height: 50,
              ),

              //Login Form
              const LoginPage(),
            ],
          ),
        ),
      ),
    );
  }
}
//END OF LOGINPAGE CLASS



// class LoginScreen extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // final user = Provider.of<User>(context); // Access the User model

//     return Scaffold(
//       appBar: AppBar(title: const Text('Hospital Management App')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: emailController,
//               decoration: const InputDecoration(hintText: 'Email'),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: passwordController,
//               decoration: const InputDecoration(hintText: 'Password'),
//               obscureText: true,
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 final String email = emailController.text;
//                 final String password = passwordController.text;

//                 // Perform validation
//                 if (_isValidEmail(email) && _isValidPassword(password)) {
//                   // Set email in User model
//                   // user.setEmail(email);

//                   // Navigate to the main page upon successful login
//                   Navigator.pushNamed(context, RouteManager.mainPage);
//                 } else {
//                   // Show error message if validation fails
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Invalid email or password'),
//                     ),
//                   );
//                 }
//               },
//               child: const Text('Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   bool _isValidEmail(String email) {
//     // Basic email validation
//     return email.isNotEmpty && email.contains('@');
//   }

//   bool _isValidPassword(String password) {
//     // Password validation criteria: at least 8 characters
//     return password.isNotEmpty && password.length >= 8;
//   }
// }

// class MainPage extends StatelessWidget {
//   const MainPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Get the User object using Provider
//     // final String userEmail = Provider.of<User>(context).email;

//     return Scaffold(
//       appBar: AppBar(title: const Text('Reflective App')),
//       body: const Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Welcome!',
//               style: TextStyle(fontSize: 24),
//             ),
//             SizedBox(height: 16),
//           //   Text(
//           //     // 'Email: $userEmail', // Display the entered email
//           //   ),
//           //   // Add your other widgets here
//           //
//            ],
//         ),
//       ),
//     );
//   }
// }





