// import 'dart:js';

import 'dart:async';

import 'package:flutter/material.dart';
import '../bloc/bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Center(
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Form(
                    child: Column(children: [
                  Container(margin: const EdgeInsets.symmetric(vertical: 10.0)),
                  emailField(),
                  Container(margin: const EdgeInsets.symmetric(vertical: 10.0)),
                  passwordField(),
                  Container(margin: const EdgeInsets.symmetric(vertical: 30.0)),
                  submitButton()
                ])))));
  }

  Widget emailField() {
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

  Widget passwordField() {
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

  Widget submitButton() {
    return ElevatedButton(
      child: const Text('Login'),
      // add static style, check docs for button state styles
      style: ElevatedButton.styleFrom(primary: Colors.green),
      onPressed: () {},
    );
  }
}
