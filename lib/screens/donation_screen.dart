import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  List<Map<String, dynamic>> datas = [
    {
      'title': 'Reviewing your General Information.',
      'description':
          'We will review your details. Please note that we may contact you for additional information.',
      'icon': 'assets/person.png'
    },
    {
      'title': 'Your General Information has been Reviewed.',
      'description':
          'Please be aware that on the specified date of your planned blood donation, you will have the chance to fill out the Blood Donor Interview Sheet ahead of time.',
      'icon': 'assets/preview.png'
    },
    {
      'title': 'D-Day of your Donation',
      'description':
          'Today marks the your designated day for blood donation! Kindly spare a moment to complete the Blood Donor Interview Sheet.',
      'icon': 'assets/pen.png'
    },
    {
      'title': 'Your Donated Blood is Being Tested',
      'description':
          'Thank you for Donating! Please be informed that Blood Testing will take 5 - 7 Days.',
      'icon': 'assets/flask.png'
    },
    {
      'title': 'Thank you for Saving Lives!',
      'description':
          'A heartfelt thank you for your selfless act of donating blood. You are everyone’s hero!',
      'icon': 'assets/heart2.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/logo.png',
                width: 150,
                // height: 100,
              ),
              const Text(
                'Have a Great Day!',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Your Blood Donation Journey',
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFFF1413D),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF43A0E3),
                  borderRadius: BorderRadius.circular(10.0), // Rounded border
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Call for Blood Donors w/ Dunkin Donuts',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '01/11/2024 | 9:00AM - 3:00PM',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      Text(
                        'Capitol CMPD, Guinhawa, Malolos City Bulacan',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                // color: Colors.red,
                child: Column(
                  children: datas.map((data) {
                    return Row(
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              data['icon'],
                              height: 45,
                              width: 45,
                            ),
                            Image.asset(
                              'assets/ellipses.png',
                              height: 50,
                              // width: 50,
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['title'],
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  data['description'],
                                  style: const TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
