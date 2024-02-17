import 'package:blood_drive/screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bryan/components/textboxes.dart';
import 'bryan/registerPage1.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailcontroller = new TextEditingController();
  TextEditingController _passwordcontroller = new TextEditingController();

  void home(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const MainScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Other siblings here
                    Text(
                      'Create\nAccount',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF1413D),
                          height: 1),
                    ),
                    Text(
                        'Enter your email address and password to get access to our account')
                  ],
                ),
              ),
              // Sized box here ??
              loginTextField(
                controller: _emailcontroller,
                labelText: 'Email',
                keyboardType: TextInputType.text,
                icon: Icons.person,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),

              //TextField
              loginPasswordField(
                controller: _passwordcontroller,
                labelText: 'Password',
                keyboardType: TextInputType.text,
                icon: Icons.lock,
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color(0xFF0062d9),
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.015),

              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                    email: _emailcontroller.text,
                    password: _passwordcontroller.text,
                  )
                      .then((value) {
                    // Authentication successful, navigate to home
                    home(context);
                  }).catchError((error) {
                    // Handle authentication errors
                    print("Error: $error");
                    // Show a snackbar or any other UI indication for invalid credentials
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Invalid credentials. Please check your email and password.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Color(0xFF0062d9),
                      ),
                    );
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.85, 40.0),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  'Log In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.01),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return const registerPage1();
                      }));
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color(0xFF0062d9),
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
