import 'package:flutter/material.dart';
import 'package:movies_store/modules/homeScreen/homeScreen.dart';

import '../../shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  //TextController to read text entered in text field
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  bool email = false;
  bool password = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Container(
          color: Color.fromARGB(251, 41, 42, 50),
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 30),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text(
                      'Login to continue',
                      style: TextStyle(
                        fontSize: 23,
                        color: Color.fromARGB(255, 99, 97, 97),
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        'assets/images/pop.png',
                        width: 300,
                        height: 300,
                      ),
                    ),
                    Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: textEditingControllerEmail,
                            onChanged: (val) {
                              _formkey.currentState?.validate();
                            },
                            keyboardType: TextInputType.text,
                            decoration: buildInputDecoration("Enter you email"),
                            validator: (value) {
                              print(value);
                              if (value!.isEmpty) {
                                return "Please Enter Email";
                              } else if (!RegExp(r'\S+@\S+\.\S+')
                                  .hasMatch(value)) {
                                return "Please Enter a Valid Email";
                              }
                              setState(() {
                                email = true;
                              });
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: textEditingControllerPassword,
                            onChanged: (val) {
                              _formkey.currentState?.validate();
                            },
                            keyboardType: TextInputType.visiblePassword,
                            decoration:
                                buildInputDecoration("Enter your password"),
                            validator: (value) {
                              print(value);
                              if (value!.isEmpty) {
                                return "Please Enter Passord";
                              } else if (!RegExp(r'^(?=.*?[!@#\$&*~]).{8,}$')
                                  .hasMatch(value)) {
                                setState(() {
                                  password = false;
                                });
                                return "Please Enter a Valid Password";
                              }
                              setState(() {
                                password = true;
                              });
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Forget Password',
                              style: TextStyle(color: Colors.grey),
                            ))
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (email && password) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                            );
                          }
                        },
                        child: Text(
                          'Login',
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
