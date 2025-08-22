import 'package:flutter/material.dart';

//Styling for TextFormFields of LoginForm
const enabledBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Color.fromARGB(255, 145, 192, 239),
    width: 1,
  ),
  borderRadius: BorderRadius.all(
    Radius.circular(10),
  ),
); //end of enabledBorder

const focusedBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Color.fromARGB(255, 145, 192, 239),
    width: 2,
  ),
  borderRadius: BorderRadius.all(
    Radius.circular(10),
  ),
); //end of focusedBorder

const errorBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.red,
    width: 1,
  ),
  borderRadius: BorderRadius.all(
    Radius.circular(10),
  ),
); //end of errorBorder

const focusedErrorBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.red,
    width: 2,
  ),
  borderRadius: BorderRadius.all(
    Radius.circular(10),
  ),
); //end of focusedErrorBorder

InputDecoration formDecoration(String labelText, IconData iconData,
    {IconData? suffixIcon}) {
  return InputDecoration(
    errorStyle: const TextStyle(
      fontSize: 15,
    ),
    errorMaxLines: 4,
    prefixIcon: Icon(
      iconData,
      color: Colors.grey,
    ),
    suffixIcon: suffixIcon != null
        ? Icon(
            suffixIcon,
            color: Colors.grey,
          )
        : null,
    labelText: labelText,
    labelStyle: const TextStyle(
      color: Colors.grey,
    ),
    enabledBorder: enabledBorder,
    focusedBorder: focusedBorder,
    errorBorder: errorBorder,
    focusedErrorBorder: focusedErrorBorder,
  );
}
//END OF FORMDECORATION METHOD
