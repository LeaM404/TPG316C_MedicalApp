import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/components/form_constants.dart';
import 'package:medical_app/components/form_validatiors.dart';
import 'package:medical_app/routes/routes.dart';
import 'package:medical_app/widgets/auth_button.dart';
import 'package:medical_app/widgets/my_button.dart';
import 'package:medical_app/widgets/my_divider.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  //GlobalKey to identify the Form widget
  final _formKey = GlobalKey<FormState>();

  //TextEditingControllers
  final _firstnameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _idNumController = TextEditingController();
  final _phoneNumController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _comfirmedPasswordController = TextEditingController();

  //Signing-Up User Method
  //Signing Users in Method
  Future<void> signUserUp() async {
    try {
      if (_passwordController.text == _comfirmedPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
      } else {
        //Password do not match error message
        showErrorMessage('Passwords Do not Match');
      }
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
          //First Name TextFormField
          TextFormField(
            keyboardType: TextInputType.text,
            controller: _firstnameController,
            decoration: formDecoration('First Name', Icons.person),
            validator: validateFirstName,
          ),

          const SizedBox(height: 20),

          //First Name TextFormField
          TextFormField(
            keyboardType: TextInputType.text,
            controller: _surnameController,
            decoration: formDecoration('Surname', Icons.person),
            validator: validateSurname,
          ),

          const SizedBox(height: 20),

          //Surname TextFormField
          TextFormField(
            keyboardType: TextInputType.number,
            controller: _idNumController,
            decoration:
                formDecoration('ID Number', Icons.picture_in_picture_alt),
            validator: validateIdNum,
            maxLength: 13,
          ),

          const SizedBox(height: 20),

          //PhoneTextFormField
          TextFormField(
            keyboardType: TextInputType.phone,
            controller: _phoneNumController,
            decoration: formDecoration('Contact Number', Icons.phone),
            validator: validatePhoneNum,
          ),

          const SizedBox(height: 20),

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
            validator: validatePassword,
            obscureText: true,
            maxLength: 8,
          ),

          const SizedBox(height: 10),

          //Confirmed Password TextFormField
          TextFormField(
            keyboardType: TextInputType.text,
            controller: _comfirmedPasswordController,
            decoration: formDecoration('Comfirm Password', Icons.lock,
                suffixIcon: Icons.visibility_off),
            validator: (value) {
              return validateConfirmPassword(_passwordController.text, value);
            },
            obscureText: true,
            maxLength: 8,
          ),

          const SizedBox(height: 10),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Remember Me
              // Checkbox(
              //   value: true,
              //   onChanged: (value) {},
              // ),
              // const Text('Remember Me'),
            ],
          ),

          const SizedBox(height: 20),

          //Sign Up Button
          MyButton(
            title: 'Sign Up',
            onTap: () {
              if (_formKey.currentState!.validate()) {
                //Navigates to MainPage
                Navigator.pushNamed(context, '/mainPage');
              }
            },
            color: Colors.lightBlue,
          ),

          const SizedBox(height: 50),

          //Sign Up with Divider
          const MyDivider(dividerText: 'Sign Up With'),

          const SizedBox(height: 30),

          //Google & Apple Sign in Options
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Google Sign-In Button
              AuthButton(
                onTap: () {},
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

          //Already have an Account? Sign In Here
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already have an Account?",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteManager.loginPage);
                },
                child: const Text(
                  'Sign in Here',
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

class SignInButton {}
//END OF RegisterForm WIDGET
