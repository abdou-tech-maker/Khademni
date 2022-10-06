// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Old extends StatefulWidget {
  const Old({super.key});

  @override
  State<Old> createState() => _OldState();
}

class _OldState extends State<Old> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
                opacity: 0.8,
                child: Image.asset(
                  'assets/imgs/1.jfif',
                  fit: BoxFit.fill,
                )),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: ClipOval(
                    child: SizedBox(
                      width: 200,
                      height: 270,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 150,
                ),
                const Text(
                  'Welcome ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Color.fromARGB(240, 243, 228, 11)),
                ),
                const Text(
                  'Let\'s Fight UnEmployement\nTogether!!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18, color: Color.fromRGBO(240, 243, 228, 11)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 20.0, left: 20.0, top: 10),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          216,
                          56,
                          56,
                        ),
                        fixedSize: const Size(200, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      child: const Text(
                        'Info ',
                        style: TextStyle(fontSize: 18),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(237, 219, 195, 2),
                        fixedSize: const Size(200, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      child: const Text(
                        'Continue ',
                        style: TextStyle(fontSize: 18),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
