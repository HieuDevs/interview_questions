import 'package:flutter/material.dart';

Widget buildButtonRunCode(BuildContext context, onPressed) {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    onPressed: () {
      onPressed();
    },
    icon: const Icon(Icons.code_rounded),
    label: const Text('Run Code'),
  );
}

Widget buildButtonClearResult(BuildContext context, onPressed) {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.errorContainer,
      foregroundColor: Theme.of(context).colorScheme.onErrorContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    onPressed: () {
      onPressed();
    },
    icon: const Icon(Icons.clear),
    label: const Text('Clear Result'),
  );
}
