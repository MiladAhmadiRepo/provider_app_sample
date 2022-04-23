import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'service/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthService authService;
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    authService=Provider.of<AuthService>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                label: Text("please enter your email")
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                label: Text("please enter your password")
              ),
            ),
          ),
          ElevatedButton(onPressed: (){
            authService.signInWithEmailAndPassword(emailController.text, passwordController.text);
          }, child: Text("login")),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, "/register");
          }, child: Text("register"))
        ],
      ),
    );
  }
}
