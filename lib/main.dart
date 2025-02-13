import 'package:flutter/material.dart';
import 'package:multi_platform_app/dsa.dart';
import 'package:multi_platform_app/flutter_apis.dart';
import 'package:multi_platform_app/flutter_knowlege.dart' show FlutterKnowlege;
import 'package:multi_platform_app/flutter_widget.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Interview Questions',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true),
      home: const MyHomePage(title: 'Flutter Interview Questions'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> lessons = [
      {'id': 1, 'title': 'DSA (Data Structures and Algorithms)', 'icon': Icons.format_list_numbered},
      {'id': 2, 'title': 'Flutter Knowledge', 'icon': Icons.flutter_dash},
      {'id': 3, 'title': 'Flutter Widgets', 'icon': Icons.widgets},
      {'id': 4, 'title': 'Flutter APIs', 'icon': Icons.cloud},
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(widget.title, style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer)),
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Welcome to Flutter Interview Questions by 7Productions!\n @created by HieuBH',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepOrange),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: lessons.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: InkWell(
                      onTap: () {
                        switch (lessons[index]['id']) {
                          case 1:
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DsaPage(lesson: lessons[index])),
                            );
                            break;
                          case 2:
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FlutterKnowlege()));
                            break;
                          case 3:
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FlutterWidget()));
                            break;
                          case 4:
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FlutterApis()));
                            break;
                          default:
                            return;
                        }
                      },
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Theme.of(context).colorScheme.primaryContainer,
                              Theme.of(context).colorScheme.secondaryContainer,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(lessons[index]['icon'], size: 40, color: Theme.of(context).colorScheme.primary),
                              const SizedBox(height: 8),
                              Text(
                                lessons[index]['title'],
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
