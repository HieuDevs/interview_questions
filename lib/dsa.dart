import 'package:flutter/material.dart';
import 'package:multi_platform_app/components/factory.dart' show buildButtonClearResult, buildButtonRunCode;

class DsaPage extends StatefulWidget {
  final Map<String, dynamic> lesson;

  const DsaPage({super.key, required this.lesson});

  @override
  State<DsaPage> createState() => _DsaPageState();
}

class _DsaPageState extends State<DsaPage> {
  final TextEditingController _arrayController = TextEditingController();
  final TextEditingController _targetController = TextEditingController();
  final TextEditingController _str1Controller = TextEditingController();
  final TextEditingController _str2Controller = TextEditingController();
  final TextEditingController _numsSumController = TextEditingController();
  final TextEditingController _targetSumController = TextEditingController();
  bool isShowArrays = false;
  bool isShowStrings = false;
  bool isShowHashMap = false;
  List<int> array = [4, 2, 7, 1, 9];
  int target = 7;
  int? result;
  String str1 = 'listen';
  String str2 = 'silent';
  bool? resultAnagram;
  List<int> nums = [2, 7, 11, 15, 2];
  int targetSum = 9;
  List<List<int>> resultSum = [];
  @override
  void initState() {
    super.initState();
    _arrayController.text = array.join(', ');
    _targetController.text = target.toString();
    _str1Controller.text = str1;
    _str2Controller.text = str2;
    _numsSumController.text = nums.join(', ');
    _targetSumController.text = targetSum.toString();
  }

  @override
  void dispose() {
    _arrayController.dispose();
    _targetController.dispose();
    _str1Controller.dispose();
    _str2Controller.dispose();
    _numsSumController.dispose();
    _targetSumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(widget.lesson['title'], style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer)),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Questions', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              _buildQuestionDSA(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionDSA() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildQuestionArrays(),
            const Divider(height: 32),
            _buildQuestionStrings(),
            const Divider(height: 32),
            _buildQuestionHashMap(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionArrays() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isShowArrays = !isShowArrays;
            });
          },
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  'Practice Exercise: Linear Search',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 8),
              Icon(isShowArrays ? Icons.arrow_drop_up : Icons.arrow_drop_down),
            ],
          ),
        ),
        if (isShowArrays) ...[
          const SizedBox(height: 12),
          const Text(
            'Write a function that finds a target number in an array using linear search. Return the index if found, or -1 if not found.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          const Text(
            'Example:\nInput: array = [4, 2, 7, 1, 9], target = 7\nOutput: 2\n\nInput: array = [4, 2, 7, 1, 9], target = 3\nOutput: -1',
            style: TextStyle(fontSize: 14, fontFamily: 'monospace', backgroundColor: Color(0xFFE0E0E0)),
          ),
          const SizedBox(height: 16),
          const Text('Requirements:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          const Text(
            '• Return the index immediately when found\n'
            '• Return -1 if target is not found after checking all elements',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _arrayController,
            decoration: const InputDecoration(
              labelText: 'Enter array (comma separated numbers)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _targetController,
            decoration: const InputDecoration(labelText: 'Enter target number', border: OutlineInputBorder()),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: buildButtonRunCode(context, () {
                  setState(() {
                    try {
                      array = _arrayController.text.split(',').map((e) => int.parse(e.trim())).toList();
                      target = int.parse(_targetController.text.trim());
                      _runCodeArrays(array, target);
                    } catch (e) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(const SnackBar(content: Text('Please enter valid numbers')));
                    }
                  });
                }),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: buildButtonClearResult(context, () {
                  setState(() {
                    result = null;
                  });
                }),
              ),
            ],
          ),
          if (result != null) ...[
            const SizedBox(height: 16),
            Text('Result: $result', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ],
      ],
    );
  }

  void _runCodeArrays(List<int> array, int target) {
    /// WRITE CODE HERE AND MODIFY result

    result = -100;
  }

  Widget _buildQuestionStrings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isShowStrings = !isShowStrings;
            });
          },
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  'Practice Exercise: String Manipulation',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 8),
              Icon(isShowStrings ? Icons.arrow_drop_up : Icons.arrow_drop_down),
            ],
          ),
        ),
        if (isShowStrings) ...[
          const SizedBox(height: 12),
          const Text(
            'Write a function that checks if two strings are anagrams of each other. Two strings are anagrams if they contain the same characters with the same frequencies.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          const Text(
            'Example:\nInput: str1 = "listen", str2 = "silent"\nOutput: true\n\nInput: str1 = "hello", str2 = "world"\nOutput: false',
            style: TextStyle(fontSize: 14, fontFamily: 'monospace', backgroundColor: Color(0xFFE0E0E0)),
          ),
          const SizedBox(height: 16),
          const Text('Requirements:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          const Text('• Return true if all frequencies match, false otherwise', style: TextStyle(fontSize: 14)),
          const SizedBox(height: 8),
          TextField(
            controller: _str1Controller,
            decoration: const InputDecoration(labelText: 'Enter string 1', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _str2Controller,
            decoration: const InputDecoration(labelText: 'Enter string 2', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: buildButtonRunCode(context, () {
                  setState(() {
                    str1 = _str1Controller.text;
                    str2 = _str2Controller.text;
                    _runCodeStrings(str1, str2);
                  });
                }),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: buildButtonClearResult(context, () {
                  setState(() {
                    resultAnagram = null;
                  });
                }),
              ),
            ],
          ),
          if (resultAnagram != null) ...[
            const SizedBox(height: 16),
            Text('Result: $resultAnagram', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ],
      ],
    );
  }

  void _runCodeStrings(String str1, String str2) {
    // WRITE CODE HERE AND MODIFY resultAnagram

    resultAnagram = false;
  }

  Widget _buildQuestionHashMap() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isShowHashMap = !isShowHashMap;
            });
          },
          child: Row(
            children: [
              const Expanded(
                child: Text('Practice Exercise: Two Sum', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 8),
              Icon(isShowHashMap ? Icons.arrow_drop_up : Icons.arrow_drop_down),
            ],
          ),
        ),
        if (isShowHashMap) ...[
          const SizedBox(height: 12),
          const Text(
            'Write a function that finds all pairs of numbers in an array that add up to a target sum. Return their indices.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          const Text(
            'Example:\nInput: nums = [2, 7, 11, 15, 2], target = 9\nOutput: [[0, 1], [1, 4]]\nExplanation: \nnums[0] + nums[1] = 2 + 7 = 9\nnums[1] + nums[4] = 7 + 2 = 9',
            style: TextStyle(fontSize: 14, fontFamily: 'monospace', backgroundColor: Color(0xFFE0E0E0)),
          ),
          const SizedBox(height: 16),
          const Text('Requirements:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          const Text(
            '• Return all pairs of indices that sum to target\n• Handle duplicate numbers in the array',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _numsSumController,
            decoration: const InputDecoration(
              labelText: 'Enter array (comma separated numbers)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _targetSumController,
            decoration: const InputDecoration(labelText: 'Enter target sum', border: OutlineInputBorder()),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: buildButtonRunCode(context, () {
                  setState(() {
                    nums = _numsSumController.text.split(',').map((e) => int.parse(e.trim())).toList();
                    targetSum = int.parse(_targetSumController.text.trim());
                    _runCodeHashMap(nums, targetSum);
                  });
                }),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: buildButtonClearResult(context, () {
                  setState(() {
                    resultSum = [];
                  });
                }),
              ),
            ],
          ),
          if (resultSum.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text('Result: $resultSum', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ],
      ],
    );
  }

  void _runCodeHashMap(List<int> nums, int targetSum) {
    // WRITE CODE HERE AND MODIFY resultSum

    resultSum = [];
  }
}
