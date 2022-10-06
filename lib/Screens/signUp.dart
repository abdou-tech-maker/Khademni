import 'package:flutter/material.dart';
import 'package:khademni/Screens/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _signupState();
}

class _signupState extends State<Signup> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back,
          ),
          title: const Text('SignUp Page'),
          backgroundColor: const Color(0xFF009688),
          elevation: 0.5,
        ),
        body: Stepper(
          type: StepperType.horizontal,
          steps: getSteps(),
          currentStep: currentStep,
          onStepContinue: () {
            final isLastStep = currentStep == getSteps().length - 1;
            if (isLastStep) {
              // ignore: avoid_print
              print('Completed');
              //Send Data To Server
            } else {
              setState(() {
                currentStep += 1;
              });
            }
          },
          onStepCancel: () {
            final isFirstStep = currentStep == getSteps().length - 3;
            if (isFirstStep) {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Login()));
            } else {
              setState(() {
                currentStep -= 1;
              });
            }
          },
        ));
  }

  List<Step> getSteps() => [
        Step(
            isActive: currentStep >= 0,
            title: const Text('Account'),
            content: Container()),
        Step(
            isActive: currentStep >= 1,
            title: const Text('Informations'),
            content: Container()),
        Step(
            isActive: currentStep >= 2,
            title: const Text('Complete'),
            content: Container()),
      ];
}
