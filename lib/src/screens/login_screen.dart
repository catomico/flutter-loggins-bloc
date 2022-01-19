// import 'dart:js';

import 'dart:async';

import 'package:flutter/material.dart';
import '../bloc/bloc.dart';

// because we changed from global to scoped instances of bloc, things like bloc.changeEmail won;t work, the provider gives us scoped instances
import '../bloc/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  // This static method from provider.dart
  // static Bloc of(BuildContext context) {
  //   return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider).bloc;
  // }
  //  we don't creat an instance of Provider class, rather an of
  // inside the build method go up the hierarchy to find a provider

  @override
  Widget build(context) {
    final bloc = Provider.of(context);

    return Center(
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Form(
                    child: Column(children: [
                  Container(margin: const EdgeInsets.symmetric(vertical: 10.0)),
                  emailField(bloc),
                  Container(margin: const EdgeInsets.symmetric(vertical: 10.0)),
                  passwordField(bloc),
                  Container(margin: const EdgeInsets.symmetric(vertical: 30.0)),
                  submitButton(bloc)
                ])))));
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder<String>(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@example.com',
            labelText: 'Email Address',
            errorText: snapshot.error.toString(),
          ),
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder<String>(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.chanegePassword,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            labelText: 'Password',
            errorText: snapshot.error.toString(),
          ),
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.submitValid,
        builder: (context, snapshot) {
          return ElevatedButton(
            child: const Text('Login'),
            // add static style, check docs for button state styles
            style: ElevatedButton.styleFrom(primary: Colors.green),
            onPressed: snapshot.hasData
                ? () {
                    print("hllo there");
                  }
                : null,
          );
        });
  }
}
