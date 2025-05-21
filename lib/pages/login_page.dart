import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  final firebaseAuth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isLoding = false;
  String? errorMessage;

  void _submit() async {
    errorMessage = null;
    setState(() {
      isLoding = true;
    });

    await Future.delayed(Duration(seconds: 2));
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      /// Champs de Text recuperer
      final email = _emailController.text;
      final pwd = _passwordController.text;

      try {
        final result = await firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: pwd,
        );

        print('resultat ::: $result');

        setState(() {
          isLoding = false;
        });

        context.goNamed('productList');
      } on FirebaseAuthException catch (e) {
        print("Erreur : ${e.code}");
        errorMessage = 'code : ${e.code} ---> ${e.message}';
      }
    }
    setState(() {
      isLoding = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0XFFd9d9d9),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/login/dunk.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Align(
              //   alignment: Alignment.topRight,
              //   child: Container(
              //     margin: EdgeInsets.only(right: 10),
              //     padding: EdgeInsets.symmetric(vertical: 10),
              //     decoration: BoxDecoration(),
              //     child: Text(
              //       'Veuillez\nvous\nconnectez'.toUpperCase(),
              //       style: TextStyle(
              //         fontSize: 32,
              //         fontWeight: FontWeight.bold,
              //         letterSpacing: 1,
              //         color: Colors.black,
              //       ),
              //     ),
              //   ),
              // ),
              Positioned(
                top: size.height * .3,
                right: 10,
                left: 10,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: .5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: size.height * .4,
                      width: size.width * .9,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'shodie'.toUpperCase(),
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                color: Colors.white,
                              ),
                            ),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      Text(
                                        'Email'.toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      TextFormField(
                                        validator: (value) {
                                          /// 12345, vide
                                          if (value == null || value.isEmpty) {
                                            return 'Mot de passe requis';
                                          }
                                          // else if (!(value
                                          //         .trim()
                                          //         .isNotEmpty &&
                                          //     value.trim().contains('@'))) {
                                          //   return 'Email doit contenir @';
                                          // }
                                          else if (!isEmailValid(value)) {
                                            return 'Veuillez entrer un email valide';
                                          }
                                          return null;
                                        },
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        controller: _emailController,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        decoration: _buildInputDecoration(
                                          'Entre votre email',
                                        ),
                                      ),

                                      SizedBox(height: 20),
                                      Text(
                                        'Password'.toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      TextFormField(
                                        validator: (value) {
                                          /// 12345, vide
                                          if (value == null || value.isEmpty) {
                                            return 'Mot de passe requis';
                                          }
                                          return null;
                                        },
                                        obscureText: true,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),

                                        keyboardType: TextInputType.text,
                                        controller: _passwordController,
                                        decoration: _buildInputDecoration(
                                          'Entre votre mot de passe',
                                        ),
                                      ), // email
                                    ],
                                  ),

                                  // password
                                  // button valider
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                    ),
                                    onPressed: () {
                                      _submit();
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        (isLoding)
                                            ? SizedBox(
                                              height: 30,
                                              width: 30,
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                            : Text(
                                              'valider',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                      ],
                                    ),
                                  ),
                                  if (errorMessage != null)
                                    Text(
                                      '$errorMessage',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                ],
                              ),
                            ), // email
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,

      // errorText: errorText,
      labelStyle: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
        color: Colors.white.withValues(alpha: .5),
      ),
      // fillColor: Colors.white.withValues(alpha: .5).withValues(alpha: .4),
      // filled: true,
      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.white.withValues(alpha: .5)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.white.withValues(alpha: .5)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.white.withValues(alpha: .5)),
      ),
    );
  }
}
