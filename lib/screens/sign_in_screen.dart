import 'package:e_commerce_app_first/Provider/provider.dart';
import 'package:flutter/material.dart';

import '../auth/auth_helper.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  //  SignInScreen({Key? key}) : super(key: key);
  // TextEditingController _emailTextEditing =TextEditingController();
  // TextEditingController _passwordTextEditing =TextEditingController();
  late String email, password;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, AppProvider provider, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            title: Text(
              'Sign In',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (v) {
                      provider.emailValidator.hasMatch(v.toString());
                    },
                    onChanged: (v) {
                      widget.email = v;
                    },
                    decoration: InputDecoration(
                        label: Text('E-mail'), border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    obscureText: true,
                    validator: (val) {
                      if (val!.isEmpty || val.length < 8) {
                        print('Invalid Password, Too short!');
                      }
                      return null;
                    },
                    onChanged: (v) {
                      widget.password = v;
                    },
                    decoration: InputDecoration(
                        label: Text('Password'), border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        AuthHelper.authHelper
                            .signUp(widget.email, widget.password);
                      },
                      child: Text('Sign Up')),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
