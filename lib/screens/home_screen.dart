import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                    'Enter your email address and password',
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock), // Leading icon
                      suffixIcon: GestureDetector(
                        onTap: _togglePasswordVisibility,
                        child: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
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
