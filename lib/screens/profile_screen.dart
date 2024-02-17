import 'package:blood_drive/screens/edit_profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late User? _user;

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(_user?.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (!snapshot.hasData || snapshot.data!.data() == null) {
            return const Text('No data available');
          }

          final data = snapshot.data!.data()! as Map<String, dynamic>;
          Timestamp birthDateTimestamp = data['birthDate'];
          DateTime birthDate = birthDateTimestamp.toDate();
          String formattedBirthDate =
              DateFormat('yyyy-MM-dd').format(birthDate);

          return Padding(
            padding: const EdgeInsets.all(32.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(
                'assets/logo.png',
                width: 100,
                // height: 100,
              ),
              const Text('Have a Great Day!',
                  style: TextStyle(
                    fontSize: 20.0,
                  )),
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularImageWithOverlay(),
                    Text(data['firstName'] + " " + data['lastName'],
                        style: const TextStyle(
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.email),
                          const SizedBox(width: 17.0),
                          Expanded(
                            child: Text(
                              data['email'],
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.cake),
                          const SizedBox(width: 17.0),
                          Expanded(
                            child: Text(
                              formattedBirthDate,
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.star),
                          const SizedBox(width: 17.0),
                          Expanded(
                            child: Text(
                              data['civilStatus'],
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.pin_drop),
                          const SizedBox(width: 17.0),
                          Expanded(
                            child: Text(
                              data['province'] + " " + data['municipality'],
                              style: const TextStyle(fontSize: 16.0),
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
        });
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
