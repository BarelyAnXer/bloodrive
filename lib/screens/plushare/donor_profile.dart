import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DonorProfile extends StatefulWidget {
  const DonorProfile({super.key});

  @override
  State<DonorProfile> createState() => _DonorProfileState();
}

class _DonorProfileState extends State<DonorProfile> {
  List<Map<String, dynamic>> data = [
    {'icon': Icons.settings, 'text': 'My Information'},
    {'icon': Icons.info_outline_rounded, 'text': 'Settings'},
    {'icon': Icons.question_mark, 'text': 'Help'},
    // {'icon': Icons.newspaper, 'text': 'Help'},
    // {'icon': Icons.logout, 'text': 'Help'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 32, 0, 0),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/profile.jpg',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Text("John Doe")
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // alignment: Alignment.center,
                    width: 250,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black, // Border color
                        width: 0.5, // Border width
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/heart.png',
                                height: 50, width: 50),
                            const Text("1"),
                            const Text('Saved Lives'),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/blood.png',
                                height: 50, width: 50),
                            const Text("O+"),
                            const Text('Blood Group'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                height: 50,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '20',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent, fontSize: 18),
                          ),
                          Text(
                            'Jan',
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      flex: 7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Upcoming Donation Date',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '3 days left',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        'assets/wave.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Column(
                children: data.map((data) {
                  return Container(
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Icon(
                            data['icon'],
                            color: Colors.blue,
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Text(data['text']),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Image.asset(
            'assets/circles.png',
            width: 120,
            height: 120,
            // fit: BoxFit.cover,
          ),
        ),
      ]),
    );
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
        ],
      ),
    );
  }
}
