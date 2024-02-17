import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';

class BloodDonorDonation extends StatefulWidget {
  const BloodDonorDonation({super.key});

  @override
  State<BloodDonorDonation> createState() => _BloodDonorDonationState();
}

class _BloodDonorDonationState extends State<BloodDonorDonation> {
  String selectedOption = '';
  int _counter = 1;
  final int _totalQuestions = 20;

  final List<String> _tagalogQuestions = [
    "",
    'Maayos ba ang iyong kalusugan at pakiramdam ngayong araw na ito?',
    'Nagkaroon ba ng pagkakataon na ikaw ay natanggihan o nasabing hindi maaring magbigay ng dugo? Kung OO sa anong dahilan?',
    'Sa loob ng 24 oras nakainom ka ba ng alak, beer, o aumang inuming may alkohol?',
    'Sa susunod na 12 oras, magmamaneho ka ba ng sasakyan o magpapaandar ng makinarya?',
    'Sa loob ng 24 na oras, sasakay ka ba sa eroplano?',
    'Sa nakalipas na taon, ikaw ba ay nagpabunot ng ngipin? Kung OO kailan?',
    'Sa loob ng 3 araw, nakainom ka ba ng aspirin o pain reliever? Kung OO ano at kailan?',
    'Sa nakalipas na 4 na linggo, nakainom ka ba ng gamot/nabakunahan? Kung OO, ano at kailan?'
        'Sa nakalipas na 3 buwan, nagkaroon ka ba ng bulutong o singaw?',
    'Naghandog ka ba ng dugo, platelets, o plasma? Kung OO, kailan ang huling handog?',
    'Sa nakalipas na 6 na buwan, nasa pangangalaga ka ba ng doktor dahil sa isang uri ng pagkakasakit? ',
    'Nagkaroon ka ba ng mga sumusunod na karamdaman: Kanser, Sakit sa puso o pananakit sa dibdib, sakit sa baga, tuberculosis o hika, malaria, sakit sa bato, o iba pang sakit na di nabanggit sa una o naoperahan? Kung OO, ano itong karamdaman?',
    'Nakapunta ka ba sa lugar na laganap ang malarya, katulad ng Palawan at Mindoro?',
    'May pagkakataon ba na ikaw ay nanilaw, nagkahepatitis, nakihalubilo sa may sakit sa atay?',
    'Mula 1980 hanggnag ngayon, nagbiyahe ka ba sa United Kingdom or Europa? (CJD, vCJD, madcow disease) kung OO, kailan at gaano katagal?',
    'a kasulukuyan., ikaw ba ay may karamdaman, sipon, lagnat, pangangati (ALLERGY) o nakagagawang sakit?',
    'Sa nakalipas na 1 taon, nanirahan ka ba sa ibang lugar or nagbiyahe sa ibang bansa? Kung OO saan at kailan?',
    'Sa nakalipas na 1 taon, nakulong o napiit ka ba?',
    'Nakagamit ka ba ng ipinagbabawal na gamot?',
    'Nasalinan ka ba ng dugo, naoperahan at nabigyan ng bahagi ng katawan ng ibang tao?'
  ];
  final List<String> _englishQuestion = [
    "",
    "Is your health and well-being okay today?",
    "Have there been occasions when you were rejected or told that you cannot donate blood? If YES, for what reason?",
    "Within the past 24 hours, have you consumed alcohol, beer, or any other alcoholic beverages?",
    "In the next 12 hours, will you be driving a vehicle or operating machinery?",
    "Within the next 24 hours, will you be boarding an airplane?",
    "Did you have your tooth pulled out in the past year? If YES, when?",
    "Within the past 3 days, have you taken aspirin or any pain reliever? If YES, what and when?",
    "In the past 4 weeks, have you taken any medication/been vaccinated? If YES, what and when?",
    "In the past 3 months, have you had chickenpox or mouth sores?",
    "Have you donated blood, platelets, or plasma? If YES, when was your last donation?",
    "Have you been under the care of a doctor for any type of illness in the past 6 months?",
    "Have you had any of the following illnesses: Cancer, Heart disease or chest pain, Lung disease, Tuberculosis or asthma, Malaria, Kidney disease, or any other illnesses not mentioned previously or undergone surgery for? If YES, what are these illnesses?",
    "Have you been to places where malaria is prevalent, such as Palawan and Mindoro?",
    "Have you ever experienced jaundice, hepatitis, or been in contact with someone with liver disease?",
    "From 1980 until now, have you traveled to the United Kingdom or Europe? If YES, when and for how long?",
    "Currently, do you have any illness, colds, fever, itching, or any other discomfort?",
    "In the past year, have you lived elsewhere or traveled to other countries? If YES, where and when?",
    "In the past year, were you imprisoned or detained?",
    "Have you used illegal drugs?",
    "Have you received blood transfusions, undergone surgery, or received parts of another person's body?"
  ];
  List<String> _answers = [];
  List<bool?> _radioAnswers = List.filled(20, null);

  bool tagalogOrEnglish = false;

  // true == english
  // false == tagalog

  final FlutterTts _flutterTts = FlutterTts();
  final List<Map> _voices = [];
  Map? _currentVoice;
  int? _currentWordStart, _currentWordEnd;

  final SpeechToText _speechToText = SpeechToText();

  bool _speechEnabled = false;
  List<String> _wordsSpokenList = [];
  double _confidenceLevel = 0;

  @override
  void initState() {
    super.initState();
    initTTS();
    initSTT();
  }

  void initSTT() async {
    _speechEnabled = await _speechToText.initialize();
  }

  void initTTS() {
    _flutterTts.setProgressHandler((text, start, end, word) {
      setState(() {
        _currentWordStart = start;
        _currentWordEnd = end;
      });
    });
    _flutterTts.setVoice({"name": 'en-us-x-tpf-local', "locale": 'en-US'});
    _flutterTts.setSpeechRate(0.5);
  }

  void setVoice(Map voice) {
    _flutterTts.setVoice({"name": voice["name"], "locale": voice["locale"]});
  }

  void _startListening() async {
    await _speechToText.listen(
      onResult: (result) {
        setState(() {
          _wordsSpokenList = result.recognizedWords.split(' ');

          if (_wordsSpokenList.contains("yes")) {
            print("The word 'yes' is in the list.");
            _radioAnswers[_counter - 1] = true;
            _counter++;
            _speechToText.stop();
          } else if (_wordsSpokenList.contains("no")) {
            _radioAnswers[_counter - 1] = false;
            _counter++;
            _speechToText.stop();
          } else {
            print("elseeese");
          }

          _confidenceLevel = result.confidence;
        });
      },
      // partialResults: true,
      // sampleRate: 44100,
      // listenFor: const Duration(seconds: 3),
    );
    setState(() {
      _confidenceLevel = 0;
    });
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  print(_wordsSpokenList.toString());
                },
                child: Text(
                  _speechToText.isListening
                      ? "listening..."
                      : _speechEnabled
                          ? "Tap the microphone to start listening..."
                          : "Speech not available",
                  style: const TextStyle(fontSize: 20.0),
                ),
              ),
              DropdownButton(
                value: _currentVoice,
                items: _voices
                    .map(
                      (_voice) => DropdownMenuItem(
                        value: _voice,
                        child: Text(
                          _voice["name"],
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {},
              ),
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
                                GestureDetector(
                                  onTap: () {
                                    _flutterTts.stop();
                                    _currentWordEnd = 0;
                                    _currentWordStart = 0;
                                    setState(() {
                                      _counter = (_counter == 1)
                                          ? _counter
                                          : _counter - 1;
                                    });
                                  },
                                  child: Image.asset(
                                    'assets/ArrowRightSquareFill.png',
                                    width: 25,
                                    height: 25,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'Back',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                _flutterTts.speak(
                                    "$_counter ${tagalogOrEnglish ? _tagalogQuestions[_counter] : _englishQuestion[_counter]}");
                              },
                              child: Image.asset(
                                'assets/megaphone.png',
                                width: 25,
                                height: 25,
                              ),
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Next',
                                  style: TextStyle(fontSize: 16),
                                ),
                                const SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    _flutterTts.stop();
                                    _currentWordEnd = 0;
                                    _currentWordStart = 0;
                                    setState(() {
                                      _counter = (_counter >= _totalQuestions)
                                          ? _counter
                                          : _counter + 1;
                                    });
                                  },
                                  child: Image.asset(
                                    'assets/ArrowLeftSquareFill.png',
                                    width: 25,
                                    height: 25,
                                  ),
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
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      "$_counter ${tagalogOrEnglish ? _tagalogQuestions[_counter] : _englishQuestion[_counter]}"
                                          .substring(0, _currentWordStart),
                                ),
                                if (_currentWordStart != null)
                                  TextSpan(
                                    text:
                                        "$_counter ${tagalogOrEnglish ? _tagalogQuestions[_counter] : _englishQuestion[_counter]}"
                                            .substring(_currentWordStart!,
                                                _currentWordEnd),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      backgroundColor: Colors.purpleAccent,
                                    ),
                                  ),
                                if (_currentWordEnd != null)
                                  TextSpan(
                                    text:
                                        "$_counter ${tagalogOrEnglish ? _tagalogQuestions[_counter] : _englishQuestion[_counter]}"
                                            .substring(_currentWordEnd!),
                                  )
                              ],
                            ),
                          ),
                          RadioListTile(
                            title: const Text('Oo'),
                            value: true,
                            groupValue: _radioAnswers[_counter - 1],
                            onChanged: (value) {
                              setState(() {
                                _radioAnswers[_counter - 1] = value!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                          RadioListTile(
                            title: const Text('Hindi'),
                            value: false,
                            groupValue: _radioAnswers[_counter - 1],
                            onChanged: (value) {
                              setState(() {
                                _radioAnswers[_counter - 1] = value!;
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
                            children: [
                              CustomSwitch(
                                onChanged: (value) {
                                  setState(() {
                                    tagalogOrEnglish = value;
                                    print(tagalogOrEnglish);
                                    if (tagalogOrEnglish == true) {
                                      _flutterTts.setLanguage("fil-PH");
                                      _flutterTts.setSpeechRate(0.5);
                                      _flutterTts.setVolume(1);
                                      _flutterTts.setPitch(1.0); // Set pitch
                                    } else {
                                      _flutterTts.setVoice({
                                        "name": 'en-us-x-tpf-local',
                                        "locale": 'en-US'
                                      });
                                    }
                                  });
                                },
                              ),
                              Text("$_counter / $_totalQuestions")
                            ]),
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
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: _speechToText.isListening
                      ? _stopListening
                      : _startListening,
                  child: _speechToText.isNotListening
                      ? Image.asset(
                          'assets/mic.png',
                          width: 75,
                          height: 75,
                        )
                      : Image.asset(
                          'assets/circles.png',
                          width: 75,
                          height: 75,
                        ),
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
  final ValueChanged<bool> onChanged;

  CustomSwitch({required this.onChanged});

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
          widget.onChanged(_switchValue); // Call the callback here
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
              'English',
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
                  widget.onChanged(_switchValue); // Call the callback here
                });
              },
              activeColor: Colors.white,
              inactiveTrackColor: Colors.grey[300],
            ),
            const SizedBox(width: 4.0),
            Text(
              'Tagalog',
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
