import 'package:flutter/material.dart';

class DonationPreparation extends StatelessWidget {
  DonationPreparation({Key? key}) : super(key: key);

  final List<String> beforeDonationItems = [
    '1. Have you ensured you had enough rest and sleep before considering blood donation?',
    '2. Within the last 24 hours, have you refrained from consuming alcohol in preparation for donating blood?',
    '3. Have you abstained from taking any medications for at least 24 hours before your scheduled blood donation?',
    '4. Did you make sure to have a meal, avoiding fatty foods, before coming in for your blood donation?',
    '5. Prior to your blood donation, have you consumed an adequate amount of fluids, such as water or juice?',
  ];

  final List<String> dayOfDonationItems1 = [
    '1. Complete the donor registration form.',
    '2. Have your blood type and hemoglobin checked.',
    '3. A physician will conduct a blood donor examination.',
    '4.Drink extra 16oz. of water (or other nonalcoholic drink before your appointment).',
    '5. Let the Blood Collection Staff if you have preferred arm or particular vein that has been used successfully in the past of draw blood.',
    '6.Wear shirt with sleeves that you can roll up above elbows'
  ];

  final List<String> dayOfDonationItems2 = [
    'Keep the strip bandage on for the next several hours and clean the area around bandage with soap and water.',
    'Do not do any heavy lifting or vigorous exercise for the rest of the day.',
    'If the needle site starts to bleed, apply pressure and raise your arm straight up for 5-10 minutes or until bleeding stops.'
  ];

  Widget _buildItemList(List<String> items) {
    return Column(
      children: items
          .map((item) => Text(
                item,
                style: const TextStyle(fontSize: 16.0),
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Before Donation',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Color(0xFF43A0E3),
              ),
            ),
            _buildItemList(beforeDonationItems),
            const SizedBox(height: 20),
            const Text(
              'Day of the Donation',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFF43A0E3),
              ),
            ),
            _buildItemList(dayOfDonationItems1),
            const Text(
              'After Donation',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFF43A0E3),
              ),
            ),
            _buildItemList(dayOfDonationItems2),
          ],
        ),
      ),
    );
  }
}
