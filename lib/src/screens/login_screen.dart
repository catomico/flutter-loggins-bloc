import 'package:flutter/material.dart';

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
    return const TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'you@example.com',
        labelText: 'Email Address',
      ),
    );
  }

  Widget passwordField() {
    return const TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        labelText: 'Password',
      ),
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
