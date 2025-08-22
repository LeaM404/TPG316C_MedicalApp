import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //Logged-In User
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 20),

          //User's Profile Image
          const Icon(
            Icons.person,
            size: 70,
          ),

          //User's Name

          //User's Surname

          //User's Email Address
          Text(currentUser.email!)
        ],
      ),
    );
  }
}
