import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BloodDonorDonation extends StatefulWidget {
  const BloodDonorDonation({super.key});

  @override
  State<BloodDonorDonation> createState() => _BloodDonorDonationState();
}

class _BloodDonorDonationState extends State<BloodDonorDonation> {
  String selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Column(children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0)),
                        color: Color(0xFF43A0E3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/ArrowRightSquareFill.png',
                                  width: 25,
                                  height: 25,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'Back',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            Image.asset(
                              'assets/megaphone.png',
                              width: 25,
                              height: 25,
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Next',
                                  style: TextStyle(fontSize: 16),
                                ),
                                const SizedBox(width: 10),
                                Image.asset(
                                  'assets/ArrowLeftSquareFill.png',
                                  width: 25,
                                  height: 25,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text(
                            '25. May bulutong ka ba nakaraang tatlong buwan?',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          RadioListTile(
                            title: const Text('Oo'),
                            value: 'Oo',
                            groupValue: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                          RadioListTile(
                            title: const Text('Hindi'),
                            value: 'Hindi',
                            groupValue: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(8.0),
                            bottomLeft: Radius.circular(8.0)),
                        color: Color(0xFF43A0E3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [CustomSwitch(), const Text('1/25')]),
                      ),
                    )
                  ]),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {},
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
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/mic.png',
                  width: 75,
                  height: 75,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSwitch extends StatefulWidget {
  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _switchValue = !_switchValue;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: _switchValue ? Colors.green : Colors.grey,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Tagalog',
              style: TextStyle(
                color: _switchValue ? Colors.grey : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 4.0),
            Switch(
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                });
              },
              activeColor: Colors.white,
              inactiveTrackColor: Colors.grey[300],
            ),
            const SizedBox(width: 4.0),
            Text(
              'English',
              style: TextStyle(
                color: _switchValue ? Colors.white : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
