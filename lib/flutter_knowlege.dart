import 'dart:math';

import 'package:flutter/material.dart';

class FlutterKnowlege extends StatefulWidget {
  const FlutterKnowlege({super.key});

  @override
  State<FlutterKnowlege> createState() => _FlutterKnowlegeState();
}

class _FlutterKnowlegeState extends State<FlutterKnowlege> {
  List<Widget> boxes = [ColorBox(), ColorBox()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Knowlege')),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Requirements:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(
                    '• The application should display two color boxes that can be swapped.\n'
                    '• Each color box should have a unique color generated randomly.\n'
                    '• When the "Swap Colors" button is pressed, the positions of the boxes should change.\n'
                    '• Ensure that the color of each box remains the same after swapping.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: boxes, // Display the boxes
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  //WRITE YOUR CODE HERE WITH 1 LINE OF CODE
                });
              },
              child: Text('Swap Colors'),
            ),
          ],
        ),
      ),
    );
  }
}

//!!! DONOT MODIFY CODE HERE
class ColorBox extends StatefulWidget {
  const ColorBox({super.key});

  @override
  State<ColorBox> createState() => _ColorBoxState();
}

class _ColorBoxState extends State<ColorBox> {
  final randomColor = Random().nextInt(256);
  @override
  Widget build(BuildContext context) {
    return Container(width: 100, height: 100, color: Color.fromARGB(255, randomColor, randomColor, randomColor));
  }
}
//!!! DONOT MODIFY CODE HERE