import 'package:flutter/material.dart';

const publicApiUrl = 'https://jsonplaceholder.typicode.com/posts';

class FlutterApis extends StatefulWidget {
  const FlutterApis({super.key});

  @override
  State<FlutterApis> createState() => _FlutterApisState();
}

class _FlutterApisState extends State<FlutterApis> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter APIs Practice')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
                '• Create a simple REST API client that can fetch data from a public API\n'
                '• Display the fetched data in a ListView\n'
                '• Add a loading indicator while data is being fetched\n'
                '• Handle and display error states appropriately\n'
                '• Implement pull-to-refresh functionality\n',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 24),
            //WRITE YOUR CODE HERE
            Expanded(child: Center(child: Text('Implement API functionality here'))),
          ],
        ),
      ),
    );
  }
}
