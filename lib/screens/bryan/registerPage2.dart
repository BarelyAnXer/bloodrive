import 'package:blood_drive/screens/bryan/registerPage1.dart';
import 'package:blood_drive/screens/bryan/utilities/utils.dart';
import 'package:blood_drive/screens/home_screen.dart';
import 'package:blood_drive/screens/main_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/textboxes.dart';

class registerPage2 extends StatefulWidget {
  final String firstname,
      middlename,
      lastname,
      birthdate,
      civilstatus,
      sex,
      houseno,
      zipcode,
      street,
      barangay,
      municipality,
      province,
      occupation,
      education,
      nationality,
      religion,
      telephonenumber,
      cellphonenumber;

  const registerPage2(
      {super.key,
      required this.firstname,
      required this.middlename,
      required this.lastname,
      required this.birthdate,
      required this.civilstatus,
      required this.sex,
      required this.houseno,
      required this.zipcode,
      required this.street,
      required this.barangay,
      required this.municipality,
      required this.province,
      required this.occupation,
      required this.education,
      required this.nationality,
      required this.religion,
      required this.telephonenumber,
      required this.cellphonenumber});

  @override
  State<registerPage2> createState() => _registerPage2State();
}

class _registerPage2State extends State<registerPage2> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  bool passwordsMatch = true;

  bool _isValidEmail(String email) {
    // Simple email validation using a regular expression
    // You might want to use a more robust validation approach in a real-world scenario
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  Future signUp() async {
    bool signUpSuccess = false;

    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Get the user ID
      final String userId = userCredential.user!.uid;

      // Add user details
      addUserDetails(
        userId,
        _emailController.text,
        widget.firstname,
        widget.middlename,
        widget.lastname,
        widget.birthdate,
        widget.civilstatus,
        widget.sex,
        widget.houseno,
        widget.zipcode,
        widget.street,
        widget.barangay,
        widget.municipality,
        widget.province,
        widget.occupation,
        widget.education,
        widget.nationality,
        widget.religion,
        widget.telephonenumber,
        widget.cellphonenumber,
      );

      // Further actions after sign up (if needed)
      // ...

      signUpSuccess = true; // Set the flag to true if sign up is successful
    } on FirebaseAuthException catch (e) {
      // Handle errors during sign up
      print("Error during sign up: $e");
      Utils.showSnackBar(e.message);
    }

    if (signUpSuccess) {
      // Navigate to MainPage only if sign-up was successful
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    }
  }

  Future addUserDetails(
    String userId,
    String email,
    String firstname,
    String middlename,
    String lastname,
    String birthdate,
    String civilstatus,
    String sex,
    String houseno,
    String zipcode,
    String street,
    String barangay,
    String municipality,
    String province,
    String occupation,
    String education,
    String nationality,
    String religion,
    String telephonenumber,
    String cellphonenumber,
  ) async {
    await FirebaseFirestore.instance.collection('Users').doc(userId).set({
      'id': userId,
      'email': email,
      'firstName': firstname,
      'middleName': middlename,
      'lastName': lastname,
      'birthDate': birthdate,
      'civilStatus': civilstatus,
      'sex': sex,
      'houseNumber': houseno,
      'zipCode': zipcode,
      'street': street,
      'barangay': barangay,
      'municipality': municipality,
      'province': province,
      'occupation': occupation,
      'education': education,
      'nationality': nationality,
      'religion': religion,
      'telephoneNumber': telephonenumber,
      'cellphoneNumber': cellphonenumber,
    });
  }

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.03),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const registerPage1();
                  }));
                },
                child: Row(
                  children: [
                    Image.asset(
                      'lib/screens/bryan/images/backbutton.png',
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color(0xFF0062d9),
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
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
                  // Other siblings here
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFF4da1e7),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: MediaQuery.of(context).size.width * 0.01),
                    child: Text(
                      'Personal Details',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.0275,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.020,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.03),
                      child: normalTextField(
                          controller: _emailController,
                          labelText: 'Enter E-mail',
                          keyboardType: TextInputType.text),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Password',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.020,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.03),
                      child: normalPasswordField(
                          controller: _passwordController,
                          labelText: 'Enter Password',
                          keyboardType: TextInputType.text),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('Password Requirements',
                                  style: TextStyle(
                                    color: Color(0xFF0062d9),
                                  )),
                            ],
                          ),

                          Row(
                            children: [
                              Icon(
                                _passwordController.text.length >= 8
                                    ? Icons.check
                                    : Icons.close,
                                color: _passwordController.text.length >= 8
                                    ? Color(0xFF0062d9)
                                    : Colors.red,
                              ),
                              Text(
                                'Minimum of 8 characters',
                                style: TextStyle(
                                  color: _passwordController.text.length >= 8
                                      ? Color(0xFF0062d9)
                                      : Colors.red,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                _passwordController.text.contains(RegExp(r'\d'))
                                    ? Icons.check
                                    : Icons.close,
                                color: _passwordController.text
                                        .contains(RegExp(r'\d'))
                                    ? Color(0xFF0062d9)
                                    : Colors.red,
                              ),
                              Text(
                                'Atleast one digit (0-9)',
                                style: TextStyle(
                                  color: _passwordController.text
                                          .contains(RegExp(r'\d'))
                                      ? Color(0xFF0062d9)
                                      : Colors.red,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                _passwordController.text.contains(
                                        RegExp(r'[!@#$%^&*(),.?":{}|<>]'))
                                    ? Icons.check
                                    : Icons.close,
                                color: _passwordController.text.contains(
                                        RegExp(r'[!@#$%^&*(),.?":{}|<>]'))
                                    ? Color(0xFF0062d9)
                                    : Colors.red,
                              ),
                              Expanded(
                                child: Text(
                                  "At least one symbol (~`!@#\$%^&*()_-+={[}]|\\:;\"'<,>.?/)",
                                  style: TextStyle(
                                    color: _passwordController.text.contains(
                                            RegExp(r'[!@#$%^&*(),.?":{}|<>]'))
                                        ? Color(0xFF0062d9)
                                        : Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ), //backlash para d mag register
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Confirm Password',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.020,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03),
                        child: TextField(
                          obscureText: true,
                          controller: _confirmpasswordController,
                          onChanged: (value) {
                            setState(() {
                              // Check if passwords match
                              passwordsMatch =
                                  _passwordController.text == value;
                            });
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            labelText: 'Re-Enter Password',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.010,
                                horizontal:
                                    MediaQuery.of(context).size.height * 0.020),
                          ),
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    if (!passwordsMatch)
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF0062d9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.005,
                            horizontal:
                                MediaQuery.of(context).size.height * 0.13),
                        child: Text(
                          'Password Not Match',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.03),
                      child: Row(
                        children: [
                          Checkbox(
                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                            activeColor: Colors.blue,
                          ),
                          Expanded(
                            child: Wrap(
                              children: [
                                Text('I agree to our'),
                                GestureDetector(
                                  onTap: () {
                                    // Navigator.push(context,
                                    //     MaterialPageRoute(builder: (context) {
                                    //   return const registerPage1();
                                    // }));
                                  },
                                  child: Text(
                                    ' Terms & Conditions ',
                                    style: TextStyle(
                                      color: Color(0xFF0062d9),
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.blue,
                                    ),
                                  ),
                                ),
                                Text('and that you have read our'),
                                GestureDetector(
                                  onTap: () {
                                    // Navigator.push(context,
                                    //     MaterialPageRoute(builder: (context) {
                                    //   return const registerPage1();
                                    // }));
                                  },
                                  child: Text(
                                    ' Privacy Policy ',
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
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    ElevatedButton(
                      onPressed: _isChecked
                          ? () async {
                              // Perform validation before signing up
                              if (_emailController.text.isEmpty ||
                                  !_isValidEmail(_emailController.text)) {
                                // Show an error message or perform any action for invalid email
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Validation Error'),
                                      content: Text(
                                          'Please enter a valid email address.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                return; // Stop the sign-up process if email is invalid
                              }

                              // Check if the email is already in the database
                              final existingUser = await FirebaseFirestore
                                  .instance
                                  .collection('Users')
                                  .where('email',
                                      isEqualTo: _emailController.text)
                                  .get();

                              if (existingUser.docs.isNotEmpty) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Validation Error'),
                                      content:
                                          Text('This email is already in use.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                return; // Stop the sign-up process if email already exists
                              }

                              if (_confirmpasswordController.text.isEmpty ||
                                  _confirmpasswordController.text.length <= 8 ||
                                  !_confirmpasswordController.text
                                      .contains(RegExp(r'\d')) ||
                                  !_confirmpasswordController.text.contains(
                                      RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                                // Show an error message or perform any action for invalid password
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Validation Error'),
                                      content: Text(
                                          'Please check the Password Requirements'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                return; // Stop the sign-up process if password is invalid
                              }

                              setState(() {
                                passwordsMatch = _passwordController.text ==
                                    _confirmpasswordController.text;
                              });

                              if (passwordsMatch) {
                                signUp();
                              }
                            }
                          : null, // Disables button if false
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(
                            MediaQuery.of(context).size.width * 0.85, 40.0),
                        primary: Colors.blue, // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(25), // Border radius
                        ),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Text(widget.firstname),
// Text(widget.middlename),
// Text(widget.lastname),
// Text(widget.birthdate),
// Text(widget.civilstatus),
// Text(widget.sex),
// Text(widget.houseno),
// Text(widget.zipcode),
// Text(widget.street),
// Text(widget.barangay),
// Text(widget.municipality),
// Text(widget.province),
// Text(widget.occupation),
// Text(widget.education),
// Text(widget.nationality),
// Text(widget.religion),
// Text(widget.telephonenumber),
// Text(widget.cellphonenumber),
