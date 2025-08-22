//Package for email validator
import 'package:email_validator/email_validator.dart';

//Email Validation
String? validateEmail(String? email) {
  if (email == null || email.isEmpty) {
    return 'Please enter your email address';
  }

  if (!EmailValidator.validate(email)) {
    return 'Please enter a valid email address.';
  }

  return null;
} //end of validateEmail Function

//First Name Validation
String? validateFirstName(String? firstName) {
  if (firstName == null || firstName.isEmpty) {
    return "Please enter your First name";
  }
  return null;
} //end of validateFirstName Function

//Surname Validation
String? validateSurname(String? surname) {
  if (surname == null || surname.isEmpty) {
    return "Please enter your Surname";
  }
  return null;
} //end of validateSurname Function

//ID-Number Validation
String? validateIdNum(String? idNum) {
  if (idNum == null || idNum.isEmpty) {
    return "Please enter your RSA Identification Number.";
  }

  if (idNum.length < 13) {
    return "RSA Identification Number must be 13 digits long";
  }

  return null;
} //end of validateIdNum Function

//Phone Number Validation
String? validatePhoneNum(String? phoneNum) {
  if (phoneNum == null || phoneNum.isEmpty) {
    return "Please enter your Phone number.";
  }

  final hasPattern = RegExp(r'^((\+27)|0)(\d{9})$');

  if (!hasPattern.hasMatch(phoneNum)) {
    return 'Invalid phone number format. Please use the South African format (e.g., 0713111853).';
  }
  return null;
} //end of validatePhoneNum Function

//DOB Validation

String? validateDateOfBirth(String? dateOfBirth) {
  if (dateOfBirth == null || dateOfBirth.isEmpty) {
    return ("Please select a Date");
  }
  return null;
} //end of validateDateOfBirth Function

//Password Validation
String? validatePassword(String? password) {
  if (password == null || password.isEmpty) {
    return 'Please enter your password';
  }

  //Password must only be 8 characters long
  if (password.length < 8) {
    return 'Your password is too short! Password must be 8 characters long';
  }

  //Password should contain at least 1 '@' symbol
  final hasSymbol = RegExp(r'[@]');
  if (!hasSymbol.hasMatch(password)) {
    return 'Your password must contain at least one @ symbol.';
  }

  //Password should contain at least 1 lowercase letter
  final hasLowercase = RegExp(r'[a-z]');
  if (!hasLowercase.hasMatch(password)) {
    return 'Your password must contain at least one lowercase letter';
  }

  //Password should contain at least 1 uppercase letter
  final hasUppercase = RegExp(r'[A-Z]');
  if (!hasUppercase.hasMatch(password)) {
    return 'Your password must contain at least one uppercase letter';
  }

  //Password should contain at least 1 number
  final hasNumber = RegExp(r'[0-9]');
  if (!hasNumber.hasMatch(password)) {
    return 'Your password must contain at least one digit';
  }
  return null;
} //end of validatePassword Function

//Validate existing password
String? validateConfirmPassword(String? password, String? confirmPassword) {
  if (confirmPassword == null || confirmPassword.isEmpty) {
    return 'Please confirm your password';
  }

  if (password != confirmPassword) {
    return 'Passwords do not match';
  }

  return null;
}//end of validateConfirmPassword

