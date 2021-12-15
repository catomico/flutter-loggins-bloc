import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'bloc/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final String appName = 'loggins me in';

  @override
  Widget build(context) {
    return Provider(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(appName),
          ),
          body: LoginScreen(),
        ),
      ),
    );
  }
}
