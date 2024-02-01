import 'package:blood_drive/screens/home_screen.dart';
import 'package:blood_drive/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    (),
    ProfileScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main screen'),
        leading: IconButton(
          icon: Image.asset('assets/back.png'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        // color: Colors.red,
        child: Center(child: Text('Welcome to my app!')),
      ),
    );
  }
}
