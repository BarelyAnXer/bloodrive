import 'package:blood_drive/screens/bryan/registerPage2.dart';
import "package:blood_drive/screens/login_screen.dart";
import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import 'components/textboxes.dart';

class registerPage1 extends StatefulWidget {
  const registerPage1({super.key});

  @override
  State<registerPage1> createState() => _registerPage1State();
}

class _registerPage1State extends State<registerPage1> {
  final TextEditingController _firstnamecontroller = TextEditingController();
  final TextEditingController _middlenamecontroller = TextEditingController();
  final TextEditingController _lastnamecontroller = TextEditingController();

  final TextEditingController _bdatecontroller = TextEditingController();

  final TextEditingController _maritalController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  final TextEditingController _housenocontroller = TextEditingController();
  final TextEditingController _zipcodecontroller = TextEditingController();
  final TextEditingController _streetcontroller = TextEditingController();
  final TextEditingController _barangaycontroller = TextEditingController();
  final TextEditingController _municipalitycontroller = TextEditingController();
  final TextEditingController _provincecontroller = TextEditingController();

  final TextEditingController _occupationcontroller = TextEditingController();
  final TextEditingController _educationController = TextEditingController();

  final TextEditingController _nationalitycontroller = TextEditingController();
  final TextEditingController _religioncontroller = TextEditingController();

  final TextEditingController _telephonecontroller = TextEditingController();
  final TextEditingController _cellphonecontroller = TextEditingController();

  final FocusNode _focusNameNode = FocusNode();
  bool _isNameFocused = false;

  final _maritalList = [
    '--Choose--',
    'Single',
    'Married',
    'Divorced',
    'Widowed'
  ];
  String? _selectedStatus = '--Choose--';

  final _genderList = ['--Choose--', 'Male', 'Female'];
  String? _selectedSex = '--Choose--';

  final _educationList = [
    '--Choose--',
    'Not Applicable',
    'Elementary',
    'Highschool',
    'College',
  ];
  String? _selectedEducation = '--Choose--';

  @override
  void initState() {
    super.initState();
    _focusNameNode.addListener(() {
      setState(() {
        _isNameFocused = _focusNameNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNameNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.03),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginScreen(); // TODO check to see if both goods login screen
                    // return const loginPage();
                  }));
                },
                child: Row(
                  children: [
                    Image.asset(
                      'lib/screens/bryan/images/backbutton.png',
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color(0xFF0062d9),
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Other siblings here
                  Text(
                    'Create\nAccount',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF1413D),
                        height: 1),
                  ),
                  // Other siblings here
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFF4da1e7),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: MediaQuery.of(context).size.width * 0.01
                    ),
                    child: Text(
                      'Personal Details',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.0275,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Full Name',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.020,
                              fontWeight: FontWeight.bold,
                              color: _isNameFocused ? Colors.blue : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.03),
                      child: normalTextField(
                          controller: _firstnamecontroller,
                          labelText: 'First Name',
                          keyboardType: TextInputType.text),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.03),
                      child: Row(
                        children: [
                          Expanded(
                              child: normalTextField(
                                  controller: _middlenamecontroller,
                                  labelText: 'Middle Name',
                                  keyboardType: TextInputType.text)),
                          SizedBox(
                              width:
                                  MediaQuery.of(context).size.height * 0.008),
                          Expanded(
                              child: normalTextField(
                                  controller: _lastnamecontroller,
                                  labelText: 'Last Name',
                                  keyboardType: TextInputType.text)),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Birth Date',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.020,
                              fontWeight: FontWeight.bold,
                              color: _isNameFocused ? Colors.blue : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.03),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: _bdatecontroller,
                          decoration: const InputDecoration(
                            hintText: 'YY-mm-dd',
                            border: InputBorder.none,
                            suffixIcon: Icon(Icons.calendar_today),
                          ),
                          readOnly: true,
                          onTap: () {
                            _selectDate();
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.03),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width *
                                          0.010),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Civil Status',
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.020,
                                          fontWeight: FontWeight.bold,
                                          color: _isNameFocused
                                              ? Colors.blue
                                              : Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.grey,
                                        )),
                                    child: DropdownButtonFormField(
                                      value: _selectedStatus,
                                      items: _maritalList
                                          .map((e) => DropdownMenuItem(
                                                child: Text(e),
                                                value: e,
                                              ))
                                          .toList(),
                                      onChanged: (val) {
                                        setState(() {
                                          _selectedStatus = val as String?;
                                          //to use controller and get value
                                          _maritalController.text =
                                              _selectedStatus ?? '';
                                        });
                                      },
                                      decoration: InputDecoration(
                                        // Set the decoration to collapsed to remove the default underline
                                        border: InputBorder.none,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                              width:
                                  MediaQuery.of(context).size.height * 0.008),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width *
                                          0.010),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Sex',
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.020,
                                          fontWeight: FontWeight.bold,
                                          color: _isNameFocused
                                              ? Colors.blue
                                              : Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.grey,
                                        )),
                                    child: DropdownButtonFormField(
                                      value: _selectedSex,
                                      items: _genderList
                                          .map((e) => DropdownMenuItem(
                                                child: Text(e),
                                                value: e,
                                              ))
                                          .toList(),
                                      onChanged: (val) {
                                        setState(() {
                                          _selectedSex = val as String?;
                                          //to use controller and get value
                                          _genderController.text =
                                              _selectedSex ?? '';
                                        });
                                      },
                                      decoration: InputDecoration(
                                        // Set the decoration to collapsed to remove the default underline
                                        border: InputBorder.none,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Home Address',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.020,
                              fontWeight: FontWeight.bold,
                              color: _isNameFocused ? Colors.blue : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.03),
                      child: Row(
                        children: [
                          Expanded(
                              child: normalTextField(
                                  controller: _housenocontroller,
                                  labelText: 'House No.',
                                  keyboardType: TextInputType.text)),
                          SizedBox(
                              width:
                                  MediaQuery.of(context).size.height * 0.008),
                          Expanded(
                              child: normalTextField(
                                  controller: _zipcodecontroller,
                                  labelText: 'Zip Code',
                                  keyboardType: TextInputType.text)),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.03),
                      child: Row(
                        children: [
                          Expanded(
                              child: normalTextField(
                                  controller: _streetcontroller,
                                  labelText: 'Street',
                                  keyboardType: TextInputType.text)),
                          SizedBox(
                              width:
                                  MediaQuery.of(context).size.height * 0.008),
                          Expanded(
                              child: normalTextField(
                                  controller: _barangaycontroller,
                                  labelText: 'Barangay',
                                  keyboardType: TextInputType.text)),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.03),
                      child: Row(
                        children: [
                          Expanded(
                              child: normalTextField(
                                  controller: _municipalitycontroller,
                                  labelText: 'Municipality',
                                  keyboardType: TextInputType.text)),
                          SizedBox(
                              width:
                                  MediaQuery.of(context).size.height * 0.008),
                          Expanded(
                              child: normalTextField(
                                  controller: _provincecontroller,
                                  labelText: 'Province',
                                  keyboardType: TextInputType.text)),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.03),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Occupation',
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.020,
                                      fontWeight: FontWeight.bold,
                                      color: _isNameFocused
                                          ? Colors.blue
                                          : Colors.grey,
                                    ),
                                  ),
                                  const Text('("N/A" if none)'),
                                ],
                              ),
                              normalTextField(
                                  controller: _occupationcontroller,
                                  labelText: '',
                                  keyboardType: TextInputType.text),
                            ],
                          )),
                          SizedBox(
                              width:
                                  MediaQuery.of(context).size.height * 0.008),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width *
                                          0.010),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Education',
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.020,
                                          fontWeight: FontWeight.bold,
                                          color: _isNameFocused
                                              ? Colors.blue
                                              : Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.grey,
                                        )),
                                    child: DropdownButtonFormField(
                                      value: _selectedEducation,
                                      items: _educationList
                                          .map((e) => DropdownMenuItem(
                                                value: e,
                                                child: Text(e),
                                              ))
                                          .toList(),
                                      onChanged: (val) {
                                        setState(() {
                                          _selectedEducation = val as String?;
                                          //to use controller and get value
                                          _educationController.text =
                                              _selectedEducation ?? '';
                                        });
                                      },
                                      decoration: InputDecoration(
                                        // Set the decoration to collapsed to remove the default underline
                                        border: InputBorder.none,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.03),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Nationality',
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.020,
                                      fontWeight: FontWeight.bold,
                                      color: _isNameFocused
                                          ? Colors.blue
                                          : Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              normalTextField(
                                  controller: _nationalitycontroller,
                                  labelText: '',
                                  keyboardType: TextInputType.text),
                            ],
                          )),
                          SizedBox(
                              width:
                                  MediaQuery.of(context).size.height * 0.008),
                          Expanded(
                              child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Religion',
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.020,
                                      fontWeight: FontWeight.bold,
                                      color: _isNameFocused
                                          ? Colors.blue
                                          : Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              normalTextField(
                                  controller: _religioncontroller,
                                  labelText: '',
                                  keyboardType: TextInputType.text),
                            ],
                          )),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.03),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Telephone Number',
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.020,
                                      fontWeight: FontWeight.bold,
                                      color: _isNameFocused
                                          ? Colors.blue
                                          : Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              phonenumberTextField(
                                  controller: _telephonecontroller,
                                  labelText: '',
                                  keyboardType: TextInputType.number),
                            ],
                          )),
                          SizedBox(
                              width:
                                  MediaQuery.of(context).size.height * 0.008),
                          Expanded(
                              child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Cellphone Number',
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.020,
                                      fontWeight: FontWeight.bold,
                                      color: _isNameFocused
                                          ? Colors.blue
                                          : Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              phonenumberTextField(
                                  controller: _cellphonecontroller,
                                  labelText: '',
                                  keyboardType: TextInputType.number),
                            ],
                          )),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    ElevatedButton(
                      onPressed: () {
                        if (_firstnamecontroller.text.isEmpty ||
                            _middlenamecontroller.text.isEmpty ||
                            _lastnamecontroller.text.isEmpty ||
                            _bdatecontroller.text.isEmpty ||
                            _maritalController.text == "--Choose--" ||
                            _genderController.text == "--Choose--" ||
                            _housenocontroller.text.isEmpty ||
                            _zipcodecontroller.text.isEmpty ||
                            _streetcontroller.text.isEmpty ||
                            _barangaycontroller.text.isEmpty ||
                            _municipalitycontroller.text.isEmpty ||
                            _provincecontroller.text.isEmpty ||
                            _occupationcontroller.text.isEmpty ||
                            _educationController.text == "--Choose--" ||
                            _nationalitycontroller.text.isEmpty ||
                            _religioncontroller.text.isEmpty ||
                            _telephonecontroller.text.isEmpty ||
                            _cellphonecontroller.text.isEmpty) {
                          // Show an error message or perform any action for invalid input
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                title: const Text(
                                  'Validation Error',
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                                content: Text(
                                  'Please fill in all fields before proceeding.',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        )),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return registerPage2(
                              firstname: _firstnamecontroller.text,
                              middlename: _middlenamecontroller.text,
                              lastname: _lastnamecontroller.text,
                              birthdate: _bdatecontroller.text,
                              civilstatus: _maritalController.text,
                              sex: _genderController.text,
                              houseno: _housenocontroller.text,
                              zipcode: _zipcodecontroller.text,
                              street: _streetcontroller.text,
                              barangay: _barangaycontroller.text,
                              municipality: _municipalitycontroller.text,
                              province: _provincecontroller.text,
                              occupation: _occupationcontroller.text,
                              education: _educationController.text,
                              nationality: _nationalitycontroller.text,
                              religion: _religioncontroller.text,
                              telephonenumber: _telephonecontroller.text,
                              cellphonenumber: _cellphonecontroller.text,
                            );
                          }));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(
                            MediaQuery.of(context).size.width * 0.85, 40.0),
                        backgroundColor: Colors.blue,
                        // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(25), // Border radius
                        ),
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    var bloodExpiry = DateTime.now().add(const Duration(days: 35));
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 18 * 365)),
      firstDate: DateTime.now().subtract(const Duration(days: 65 * 365)),
      lastDate: DateTime.now().subtract(const Duration(days: 18 * 365)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: const Color.fromARGB(255, 80, 185, 255),
            colorScheme: const ColorScheme.light(
              primary: Color.fromARGB(255, 80, 185, 255),
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (_picked != null) {
      setState(() {
        String formattedDate = DateFormat('MMMM d, y').format(_picked);
        _bdatecontroller.text = formattedDate;
      });
    }
  }
}
