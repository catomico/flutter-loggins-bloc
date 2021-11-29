import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final String appName = 'loggins me in';

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(appName),
          ),
          body: const Text('mew')),
    );
  }
}
