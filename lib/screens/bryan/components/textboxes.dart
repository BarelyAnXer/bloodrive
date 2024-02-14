import 'package:flutter/material.dart';

//LOGIN TEXT FIELD
class loginTextField extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final controller;
  final TextInputType keyboardType;
  const loginTextField(
      {super.key,
      required this.labelText,
      this.controller,
      required this.keyboardType,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.height * 0.03),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType, // Set the keyboardType property
        decoration: InputDecoration(
          //ICON
          prefixIcon: Icon(
            icon,
            color: Color(0xFF0062d9),
            size: MediaQuery.of(context).size.height * 0.03,
          ),

          fillColor: Color(0xFFf0f6fd),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(25),
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            color: Color(0xFF0062d9),
          ),
          contentPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.020,
              horizontal: MediaQuery.of(context).size.height * 0.020),
        ),
      ),
    );
  }
}

// LOGIN PASSWORD FIELD
class loginPasswordField extends StatefulWidget {
  final String labelText;
  final IconData icon;
  final controller;
  final TextInputType keyboardType;
  const loginPasswordField(
      {super.key,
      required this.labelText,
      required this.icon,
      this.controller,
      required this.keyboardType});

  @override
  State<loginPasswordField> createState() => _loginPasswordFieldState();
}

class _loginPasswordFieldState extends State<loginPasswordField> {
  //Setting passwordObscure to true (default)
  bool passwordObscured = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.height * 0.03),
      child: TextField(
        obscureText: passwordObscured,
        controller: widget.controller,
        keyboardType: widget.keyboardType, // Set the keyboardType property
        decoration: InputDecoration(
          //ICON
          prefixIcon: Icon(
            widget.icon,
            color: Color(0xFF0062d9),
            size: MediaQuery.of(context).size.height * 0.03,
          ),

          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  passwordObscured = !passwordObscured;
                });
              },
              icon: Icon(
                //Is the password Obscure?
                passwordObscured ? Icons.visibility_off : Icons.visibility,
                size: MediaQuery.of(context).size.height * 0.03,
                color: Color(0xFF0062d9),
              )),

          fillColor: Color(0xFFf0f6fd),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(25),
          ),
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: Color(0xFF0062d9),
          ),
          contentPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.020,
              horizontal: MediaQuery.of(context).size.height * 0.020),
        ),
      ),
    );
  }
}

//NORMAL TEXT FIELD
class normalTextField extends StatelessWidget {
  final String labelText;
  final controller;
  final TextInputType keyboardType;
  //final FocusNode focusNode;
  const normalTextField(
      {super.key,
      required this.labelText,
      this.controller,
      required this.keyboardType,});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        keyboardType: keyboardType, // Set the keyboardType property
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(15),
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.010,
              horizontal: MediaQuery.of(context).size.height * 0.020),
        ),
      );
  }
}

class normalPasswordField extends StatelessWidget {
  final String labelText;
  final controller;
  final TextInputType keyboardType;
  const normalPasswordField({super.key, required this.labelText, this.controller, required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: true,
        controller: controller,
        keyboardType: keyboardType, // Set the keyboardType property
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(15),
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.010,
              horizontal: MediaQuery.of(context).size.height * 0.020),
        ),
      );
  }
}

class phonenumberTextField extends StatelessWidget {
  final String labelText;
  final controller;
  final TextInputType keyboardType;
  const phonenumberTextField(
      {super.key,
      required this.labelText,
      this.controller,
      required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey), // Set the border color
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ), // Set the border radius for the left side only
          ),
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.015,
            horizontal: MediaQuery.of(context).size.height * 0.010,
          ), // Adjust padding as needed
          child: Text(
            "+63",
            style: TextStyle(
              color: Colors.black, 
            ),
          ),
        ),
        Expanded(
          child: TextField(
            controller: controller,
            keyboardType: keyboardType, // Set the keyboardType property
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ), 
                borderSide: BorderSide(color: Colors.grey),
              ),
              // Set the border radius for the right side only
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              labelText: labelText,
              labelStyle: TextStyle(
                color: Colors.grey,
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.010,
                horizontal: MediaQuery.of(context).size.height * 0.020,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
