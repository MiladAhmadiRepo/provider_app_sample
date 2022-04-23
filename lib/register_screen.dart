import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app_sample/service/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  late AuthService authService;
  @override
  void initState() {
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
          ElevatedButton(onPressed: () async {
            await authService.createUserWithEmailAndPassword(emailController.text, passwordController.text);
            Navigator.pop(context);
          }, child: Text("register"))
        ],
      ),
    );
  }
}

