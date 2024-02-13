import 'package:blood_drive/screens/plushare/main_screen_plusahre.dart';
import 'package:blood_drive/screens/main_screen.dart';
import 'package:blood_drive/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isObscure = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Your main content goes here
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 170,
                  ),
                  const Text(
                    'Welcome\nBack!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF1413D),
                      fontSize: 50.0,
                      // height: 1,
                    ),
                  ),
                  const Text(
                    'Enter your email address and password \nto get access to your account',
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Color(0xFFBFBDBD)),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xFFBFBDBD),
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color(0xFFBFBDBD),
                      ), // Leading icon
                      suffixIcon: GestureDetector(
                        onTap: _togglePasswordVisibility,
                        child: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                          color: const Color(0xFFBFBDBD),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color(0xFFF1413D),
                        fontSize: 19.0,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        print('Button Login Pressed!');

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            // builder: (_) => const MainScreenPlushare()));
                            builder: (_) => const MainScreen()));
                        // real one

                        Fluttertoast.showToast(
                          msg: "This is a toast message",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          // You can also use ToastGravity.TOP or ToastGravity.CENTER
                          timeInSecForIosWeb: 1,
                          // This parameter is ignored on Android
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xFF43A0E3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Log In'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100.0, // Adjust the width of the left line
                        height: 1.0,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 8.0), // Adjust spacing if needed
                      const Text('or'),
                      const SizedBox(width: 8.0), // Adjust spacing if needed
                      Container(
                        width: 100.0, // Adjust the width of the right line
                        height: 1.0,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  // const SizedBox(height: 8), // Add spacing between the buttons
                  Container(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        print('Button Sign Up Pressed!');
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        foregroundColor:
                            MaterialStateProperty.all(const Color(0xFF43A0E3)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      child: const Text('Sign Up'),
                    ),
                  ),
                ],
              ),
            ),

            // Positioned widget to place the circles image in the top right
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                'assets/circles.png',
                width: 150,
                height: 150,
                // fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
