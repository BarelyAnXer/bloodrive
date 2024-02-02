import 'package:blood_drive/screens/edit_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.asset(
          'assets/logo.png',
          width: 100,
          // height: 100,
        ),
        const Text('Have a Great Day!',
            style: TextStyle(
              fontSize: 20.0,
            )),
        const SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularImageWithOverlay(),
              Text("Christian Cabral Gazzingan",
                  style: TextStyle(
                    fontSize: 20.0,
                  )),
            ],
          ),
        ),
        Card(
          color: const Color(0xFFFFFFFF),
          elevation: 10, // Adjust the elevation value as needed
          shadowColor: Colors.grey, // Set the shadow color as needed
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.email),
                    SizedBox(width: 17.0),
                    Expanded(
                      child: Text(
                        'christiangazzingan38@gmail.com',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.cake),
                    SizedBox(width: 17.0),
                    Expanded(
                      child: Text(
                        '07/18/03',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.star),
                    SizedBox(width: 17.0),
                    Expanded(
                      child: Text(
                        'Single',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.pin_drop),
                    SizedBox(width: 17.0),
                    Expanded(
                      child: Text(
                        'Block 20 Lot 19 Rosal Street Grand\nRoyale Subdivision',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 120,
            child: ElevatedButton(
              onPressed: () {
                print('Edit button pressed!');
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (_) => const EditProfileScreen()));
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFFFFAC4D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.edit),
                  SizedBox(width: 8.0),
                  Text('Edit'),
                ],
              ),
            ),
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
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.edit), // Replace with your desired icon
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
