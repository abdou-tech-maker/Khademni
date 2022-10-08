// ignore: file_names
// ignore: file_names
// ignore_for_file: unused_import, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khademni/Screens/Home.dart';
import 'package:khademni/accountPage.dart';
import 'package:khademni/Screens/login.dart';

import '../buildCompeleted.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _signupState();
}

// ignore: camel_case_types
class _signupState extends State<Signup> {
  int currentStep = 0;
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isLastStep = currentStep == getSteps().length - 1;
    bool isCompleted = false;
    return Scaffold(
      backgroundColor: const Color(0xFDEDDBC3),
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
        ),
        title: const Text('SignUp Page'),
        backgroundColor: const Color(0xFF009688),
        elevation: 0.5,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
                primary: Color.fromARGB(255, 216, 56, 56))),
        child: Stepper(
          elevation: 2.0,
          type: StepperType.horizontal,
          steps: getSteps(),
          currentStep: currentStep,
          onStepContinue: () {
            final isLastStep = currentStep == getSteps().length - 1;
            if (isLastStep) {
              setState(() {
                isCompleted = true;
              });
              Navigator.of(context).pushReplacement(
                  CupertinoPageRoute(builder: ((context) => const Home())));
              //Send Data To Server
            } else {
              setState(() {
                currentStep += 1;
              });
            }
          },
          onStepTapped: (step) => {
            setState(
              () => currentStep = step,
            )
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
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ElevatedButton(
                            onPressed: details.onStepContinue,
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 216, 56, 56),
                              fixedSize: Size(size.width * 0.1, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                            child: Text(
                              isLastStep ? 'Confirm ' : 'Next',
                              style: const TextStyle(fontSize: 18),
                            )),
                      ),
                      if (currentStep != 0)
                        ElevatedButton(
                            onPressed: details.onStepCancel,
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 216, 56, 56),
                              fixedSize: Size(size.width * 0.1, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                            child: const Text(
                              'Back ',
                              style: TextStyle(fontSize: 18),
                            )),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 0,
            title: const Text('Account'),
            content: Column(
              children: [
                accountPage(),
              ],
            )),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title: const Text(' Additional Info'),
            content: Column(
              children: [
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Adress *',
                    hintText: 'Enter your Adress',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
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
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Confirm Password * ',
                    hintText: 'Confirm Your Password',
                  ),
                ),
              ],
            )),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text('Complete'),
          content: Column(children: [
            Row(
              children: const [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.perm_identity,
                          color: Color.fromARGB(255, 155, 47, 14)),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
      ];
}
