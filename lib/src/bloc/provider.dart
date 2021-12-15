import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget {
  Provider({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  // this is where the scoped instance is created to be used in a specified sectioon of the hierarchy, itc, Materaial app
  final bloc = Bloc();

  static Bloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider)
        .bloc;
  }

  @override
  bool updateShouldNotify(_) => true;
}
