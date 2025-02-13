import 'package:flutter/material.dart';

class FlutterWidget extends StatefulWidget {
  const FlutterWidget({super.key});

  @override
  State<FlutterWidget> createState() => _FlutterWidgetState();
}

class _FlutterWidgetState extends State<FlutterWidget> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Widget Practice')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: Row(
                    children: [
                      const Text('Requirements:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 8),
                      Icon(isVisible ? Icons.arrow_drop_up : Icons.arrow_drop_down),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Visibility(
                  visible: isVisible,
                  child: const Text(
                    '• Create a text widget that can be shown/hidden using a button\n'
                    '• Add controls to change the text size A+ and A- (A + will increase the text size and A - will decrease the text size)\n'
                    '• Add controls to change the text color Red and Blue (Red will change the text color to red and Blue will change the text color to blue)\n',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            Image.asset('assets/image.png', fit: BoxFit.cover),
            //WRITE YOUR CODE HERE
          ],
        ),
      ),
    );
  }
}
