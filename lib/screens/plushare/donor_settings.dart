import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DonorSettings extends StatefulWidget {
  const DonorSettings({super.key});

  @override
  State<DonorSettings> createState() => _DonorSettingsState();
}

class _DonorSettingsState extends State<DonorSettings> {
  List<Map<String, dynamic>> datas = [
    {'text': 'Change Password'},
    {'text': 'Rate Us'},
    {'text': 'Change Language'},
    {'text': 'Push Notification'},
    // {'text': 'Delete '},
  ];

  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: Image.asset('assets/backArrowBlue.png'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Column(
              children: datas.map((data) {
                return Container(
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(width: 32),
                      Expanded(
                        flex: 6,
                        child: Text(data['text'].toString(),
                            style: const TextStyle(
                                fontSize: 19, color: Colors.blueAccent)),
                      ),
                      const Expanded(
                        flex: 2,
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            Switch(
              value: _isSwitched,
              onChanged: (value) {
                setState(() {
                  _isSwitched = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
