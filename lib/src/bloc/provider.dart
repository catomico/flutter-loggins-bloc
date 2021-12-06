import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget {
  const Provider({
    Key? key,
    required this.bloc,
    required Widget child,
  }) : super(key: key, child: child);

  final Bloc bloc;

  static Bloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider)
        .bloc;
  }

  @override
  bool updateShouldNotify(_) => true;
}
