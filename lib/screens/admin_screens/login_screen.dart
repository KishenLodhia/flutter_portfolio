import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/screens/admin_screens/admin_screen.dart';
import 'package:flutter_portfolio/utils/screen_helper.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        elevation: 10,
        toolbarHeight: 100,
        title: Text(
          'Login',
          style: GoogleFonts.audiowide(),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: ScreenHelper.isMobile(context)
              ? ScreenHelper.width(context) * 0.8
              : ScreenHelper.width(context) * 0.4,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('username'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    label: Text('password'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: ScreenHelper.isMobile(context)
                      ? ScreenHelper.width(context) * 0.8
                      : ScreenHelper.width(context) * 0.4,
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        setState(() {
                          errorMessage = '';
                        });
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: usernameController.text.trim(),
                            password: passwordController.text.trim());

                        if (context.mounted) {
                          Navigator.pushReplacement(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const AdminScreen(),
                              ));
                        }
                      } on FirebaseAuthException catch (e) {
                        setState(() {
                          errorMessage = e.code;
                          passwordController.clear();
                        });
                      }
                    },
                    child: const Text('Login'),
                  ),
                ),
                SizedBox(
                  width: ScreenHelper.isMobile(context)
                      ? ScreenHelper.width(context) * 0.8
                      : ScreenHelper.width(context) * 0.4,
                  child: Text(
                    errorMessage,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
