// ignore_for_file: file_names

import 'package:flutter/material.dart';

//Account Page In Signup Form
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final password = TextEditingController();
    final confirmPassword = TextEditingController();
    final firstName = TextEditingController();
    final lastName = TextEditingController();

    return Column(
      children: [
        Row(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, bottom: 20.0),
              child: TextField(
                controller: firstName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'First Name*',
                  hintText: 'Enter your First Name',
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextField(
                controller: lastName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Last Name*',
                  hintText: 'Enter your Last Name',
                ),
              ),
            ),
          ),
        ]),
        TextFormField(
          controller: email,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            labelText: 'Email*',
            hintText: 'Enter your Email',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: password,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            labelText: 'Password *',
            hintText: 'Enter your Password',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: confirmPassword,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            labelText: 'Confirm Password * ',
            hintText: 'Confirm Your Password',
          ),
        )
      ],
    );
  }
}
