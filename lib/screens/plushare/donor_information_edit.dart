import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DonorInformationEdit extends StatefulWidget {
  const DonorInformationEdit({super.key});

  @override
  State<DonorInformationEdit> createState() => _DonorInformationEditState();
}

class _DonorInformationEditState extends State<DonorInformationEdit> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Information'),
          leading: IconButton(
            icon: Image.asset('assets/backArrowWhite.png'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/bg1.png',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 100.0),
                      alignment: Alignment.center,
                      color: Colors.transparent,
                      width: double.infinity,
                      child: const CircularImageWithOverlay()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Full Name',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: isFocused ? Colors.blue : Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter text...',
                            hintStyle: const TextStyle(color: Colors.grey),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 12.0), // Adjust the padding here
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Birthday',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: isFocused ? Colors.blue : Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: '02/13/32',
                            hintStyle: const TextStyle(color: Colors.grey),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 12.0), // Adjust the padding here
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Address',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: isFocused ? Colors.blue : Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Block 20 Lot 19 Rosal Streeet',
                            hintStyle: const TextStyle(color: Colors.grey),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 12.0), // Adjust the padding here
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ElevatedButton(
            //   onPressed: () => {print("update your info clicked")},
            //   style: ElevatedButton.styleFrom(
            //     primary: const Color(0xFF3C93E4),
            //   ),
            //   child: const Text(
            //     'UPDATE YOUR INFORMATION',
            //     style: TextStyle(
            //       color: Colors.white, // Text color
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // )
          ],
        ));
  }
}

class CircularImageWithOverlay extends StatelessWidget {
  const CircularImageWithOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('Image Clicked!');
      },
      child: Stack(
        children: [
          ClipOval(
            child: Image.asset(
              'assets/profile.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.camera_alt),
              // Replace with your desired icon
              onPressed: () {
                // Handle icon click action here
                print('Icon Clicked!');
              },
            ),
          ),
        ],
      ),
    );
  }
}
