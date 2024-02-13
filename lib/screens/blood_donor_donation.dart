import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BloodDonorDonation extends StatefulWidget {
  const BloodDonorDonation({super.key});

  @override
  State<BloodDonorDonation> createState() => _BloodDonorDonationState();
}

class _BloodDonorDonationState extends State<BloodDonorDonation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Blood Donor Interview Sheet',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const Text(
                'This Interview Sheet is designed to evaluate your previous medical history. Kindly ensure that you respond truthfully, as your health is our primary concern and we want to avoid any potential risks.'),
            Container(
              child: const Column(children: [
                Row(
                  children: [
                    Image.asset('assets/'),
                    SizedBox(width: 10),
                    Text(
                      'Hello Flutter!',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
