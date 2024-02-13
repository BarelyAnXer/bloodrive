import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenPlushare extends StatefulWidget {
  const HomeScreenPlushare({super.key});

  @override
  State<HomeScreenPlushare> createState() => _HomeScreenPlushareState();
}

class _HomeScreenPlushareState extends State<HomeScreenPlushare> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFFFF4342),
                      Color(0xFF0163DA),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(32.0),
                ),
                child: const Center(
                  child: Text(
                    'Save Lives, Donate Now',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 125,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      // Add a gap in the middle
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xFF0163DA),
                            Color(0x330163DA),
                          ],
                          stops: [0.0, 0.5],
                          transform: GradientRotation(0.5 * 3.14),
                        ),
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      child: const Center(
                        child: Text(
                          'Save Lives, Donate Now',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 125,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      // Add a gap in the middle
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xFF0163DA),
                            Color(0x330163DA),
                          ],
                          stops: [0.0, 0.5],
                          transform: GradientRotation(0.5 * 3.14),
                        ),
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      child: Center(),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Featured Blood Donation Drives",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('See Maps >>')
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                width: 350,
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.blueGrey,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/art.jpg',
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          const Text('10 February 2024', softWrap: true),
                          const Text('Dugo Ko, Dugtong ng Buhay Mo',
                              softWrap: true),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.star),
                              SizedBox(width: 8),
                              Text(
                                '3006 SM Baliwag Complex, Pagala\n, Baliwag Bulacanat SM Cinema',
                                style: TextStyle(fontSize: 16),
                                softWrap: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Image.asset(
            'assets/circles.png',
            width: 120,
            height: 120,
            // fit: BoxFit.cover,
          ),
        ),
      ]),
    );
  }
}
