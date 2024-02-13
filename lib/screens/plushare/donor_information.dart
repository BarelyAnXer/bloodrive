import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DonorInformation extends StatefulWidget {
  const DonorInformation({super.key});

  @override
  State<DonorInformation> createState() => _DonorInformationState();
}

class _DonorInformationState extends State<DonorInformation> {
  List<Map<String, dynamic>> data = [
    {'title': 'Name', 'value': 'JOHN MARK CORAZON DOE'},
    {'title': 'Email', 'value': 'johndoe@gmail.com'},
    {'title': 'Birthdate', 'value': '10/20/1991'},
    // {'title': 'Civil Status', 'value': 40},
    // {'title': 'Sex', 'value': 'YESSS UWOOHHH'},
  ];

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
          SizedBox(
            width: double.infinity,
            child: Column(
              children: data.map((object) {
                return Container(
                  padding: const EdgeInsets.all(6),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(object['title'].toString()),
                      Text(object['value'].toString()),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
                "Regularly updating your information is crucial for accuracy and security, ensuring that organizations and individuals can rely on current details for decision-making. This practice also streamlines communication, enhancing efficiency in both personal and professional spheres."),
          ),
          ElevatedButton(
            onPressed: () => {print("update your info clicked")},
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFF3C93E4),
            ),
            child: const Text(
              'UPDATE YOUR INFORMATION',
              style: TextStyle(
                color: Colors.white, // Text color
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
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
              width: 125,
              height: 125,
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
