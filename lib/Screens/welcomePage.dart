// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:khademni/buildPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'login.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final controller = PageController();
  bool islastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 60),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => islastPage = index == 2);
          },
          children: [
            buildPage(
                pageHeight: size.height * 0.7,
                pageWidth: size.width,
                color: const Color.fromRGBO(237, 219, 195, 2),
                urlImage: 'assets/imgs/4.jfif',
                title: 'Looking For Talents  ! ',
                subtitle:
                    'Here you can find Talented People with experience or wwithout '),
            buildPage(
                pageHeight: size.height * 0.7,
                pageWidth: size.width,
                color: Colors.blue.shade100,
                urlImage: 'assets/imgs/7.jfif',
                title: 'Want To Have A Job  ? ',
                subtitle:
                    'Here you can find Talented People with experience or wwithout '),
            buildPage(
                pageHeight: size.height * 0.7,
                pageWidth: size.width,
                color: const Color.fromARGB(255, 255, 250, 250),
                urlImage: 'assets/imgs/5.jfif',
                title: 'Let\'s Secure Your Future',
                subtitle: 'subtitle')
          ],
        ),
      ),
      bottomSheet: islastPage
          ? TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  backgroundColor: Colors.teal.shade700,
                  minimumSize: const Size.fromHeight(60)),
              onPressed: () async {
                //navigate directly to home
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showHome', true);
                //Navigate to Home With MaterialPageRoute
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: ((context) => const Login())));
              },
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        controller.jumpToPage(2);
                      },
                      child: Text(
                        'SKIP',
                        style: TextStyle(color: Colors.teal.shade700),
                      )),
                  Center(
                      child: SmoothPageIndicator(
                          controller: controller,
                          count: 3,
                          onDotClicked: (index) => controller.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut),
                          effect: const WormEffect(
                            spacing: 16.0,
                            dotColor: Colors.black26,
                            activeDotColor: Color.fromARGB(255, 216, 56, 56),
                          ))),
                  TextButton(
                      onPressed: () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      child: Text(
                        'NEXT',
                        style: TextStyle(color: Colors.teal.shade700),
                      ))
                ],
              ),
            ),
    );
  }
}
