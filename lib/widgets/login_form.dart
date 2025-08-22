import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/components/form_constants.dart';
import 'package:medical_app/components/form_validatiors.dart';
import 'package:medical_app/routes/routes.dart';
import 'package:medical_app/widgets/auth_button.dart';
import 'package:medical_app/widgets/my_button.dart';
import 'package:medical_app/widgets/my_divider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  //GlobalKey to identify the Form widget
  final _formKey = GlobalKey<FormState>();

  //TextEditingControllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //Signing Users in Method
  Future<void> signUserIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //Email TextFormField
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            decoration: formDecoration('Email', Icons.mail),
            validator: validateEmail,
          ),

          const SizedBox(height: 20),

          //Password TextFormField
          TextFormField(
            keyboardType: TextInputType.text,
            controller: _passwordController,
            decoration: formDecoration('Password', Icons.lock,
                suffixIcon: Icons.visibility_off),
            obscureText: true,
            validator: validatePassword,
          ),

          const SizedBox(height: 10),

          //Remeber Me Checkbox
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Remember Me
              Checkbox(
                value: true,
                onChanged: (value) {},
              ),
              const Text('Remember Me'),

              const SizedBox(width: 50),

              //Forgot Password Field?
              GestureDetector(
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          //Login Button
          MyButton(
            title: 'Sign In',
            onTap: () {
              if (_formKey.currentState!.validate()) {
                //Navigates to MainPage
                Navigator.pushNamed(context, '/mainPage');
              }
            },
            color: Colors.lightBlue,
          ),

          const SizedBox(height: 20),

          //Or Continue with Divider
          const MyDivider(
            dividerText: 'Or Continue With',
          ),

          const SizedBox(height: 30),

          //Google & Apple Sign in Options
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Google Sign-In Button
              AuthButton(
                onTap: () {
                  //AuthService().signInWithGoogle;
                },
                imagePath: 'lib/assets/images/Google Logo.png',
                textTitle: 'Google',
              ),

              //const SizedBox(width: 20),

              //Apple Sign-In Button
              AuthButton(
                onTap: () {},
                imagePath: 'lib/assets/images/Apple Logo.png',
                textTitle: 'Apple',
              ),
            ],
          ),

          const SizedBox(height: 40),

          //Don't have an Account? Create new Account
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account?",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 4),

              //Create an Account
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteManager.registrationPage);
                },
                child: const Text(
                  'Create An Account',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//END OF LOGINFORM WIDGET
