// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';

Widget buildPage(
        {required Color color,
        required double pageWidth,
        required double pageHeight,
        required String urlImage,
        required String title,
        required String subtitle}) =>
    SizedBox(
      height: pageHeight,
      width: pageWidth,
      child: Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              urlImage,
              width: pageWidth,
              height: pageHeight,
            ),
            const SizedBox(height: 30),
            Text(title,
                style: TextStyle(
                    color: Colors.teal.shade700,
                    fontSize: 32,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(subtitle,
                  style: TextStyle(
                    color: Colors.teal.shade500,
                    fontSize: 18,
                  )),
            )
          ],
        ),
      ),
    );
