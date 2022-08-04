import 'package:flutter/material.dart';

import '../auth/auth_helper.dart';

class AppProvider extends ChangeNotifier{
 GlobalKey<FormState> loginKey = GlobalKey();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
 RegExp emailValidator = RegExp(
     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  nullValidation(String? v) {
  if (v == null || v.isEmpty) {
    return 'Field is required';
  }
}

 isEmail(String v){
   return emailValidator.hasMatch(v);
 }

  emailValidation(String v){
    if(!isEmail(v)){
      return 'Invalid Email';
    }
  }
  
  passwordValidation(String v){
    if(v.length < 6){
      return ' must be 6 and more';
    }
  }

  signIn() async {
    if(loginKey.currentState!.validate()) {
      AuthHelper.authHelper.signIn(
          emailController.text, passwordController.text);
    }
  }

}
