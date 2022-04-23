import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app_sample/service/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AuthService authService;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    authService = Provider.of<AuthService>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text("you are login"),
          ),
          SizedBox(
            height: 150,
          ),
          ElevatedButton(
              onPressed: () async {
                await authService.signOut();
              },
              child: Text("logout")),
        ],
      ),
    );
  }
}
