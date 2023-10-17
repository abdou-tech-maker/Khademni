import 'package:flutter/material.dart';
import 'package:khademni/Screens/signUp.dart';
import 'package:khademni/Screens/welcomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hidePassword = true;
  void hideMyPass() {
    if (hidePassword) {
      setState(() {
        hidePassword = false;
      });
    } else {
      setState(() {
        hidePassword = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: const Color(0xFF009688),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.setBool('showHome', false);
              // ignore: use_build_context_synchronously
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Welcome()));
            },
          ),
        ],
        title: const Text('Login Page'),
      ),
      body: Container(
        color: const Color(0xFDEDDBC3),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12.0, right: 12.0, left: 12.0),
          child: Column(
            children: [
              Image.asset(
                'assets/imgs/1.jfif',
                height: size.height * 0.2,
                width: size.width,
              ),
              const Text(
                'Welcome Back, ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                textAlign: TextAlign.start,
              ),
              const Text(
                ' make it work, make it right, make it fast   ',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 10,
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.perm_identity,
                      color: Color.fromARGB(255, 155, 47, 14)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your Password',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(
                    Icons.fingerprint,
                    color: Color.fromARGB(255, 155, 47, 14),
                  ),
                  suffixIcon: IconButton(
                    color: const Color.fromARGB(255, 155, 47, 14),
                    icon: hidePassword
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onPressed: hideMyPass,
                  ),
                ),
                obscureText: hidePassword ? true : false,
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password ?',
                      style: TextStyle(color: Color.fromARGB(255, 3, 93, 153)),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 216, 56, 56),
                    fixedSize: Size(size.width * 0.9, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  child: const Text(
                    'LOGIN ',
                    style: TextStyle(fontSize: 18),
                  )),
              const SizedBox(height: 10.0),
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                const Text(
                  'Or',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    label: const Text(
                      'Sign In With Google ',
                      style: TextStyle(color: Color.fromARGB(255, 196, 147, 2)),
                    ),
                    icon: Image.asset(
                      'assets/imgs/google1.webp',
                      width: 20.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ]),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Signup()),
                  );
                },
                child: Text.rich(
                  TextSpan(
                    text: 'Don\'t have an Account ? ',
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: const [
                      TextSpan(
                          text: 'Sign Up  ',
                          style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
