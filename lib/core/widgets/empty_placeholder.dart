import 'package:flutter/material.dart';

class EmptyPlaceholder extends StatelessWidget {
  final String message;
  final bool isExpanded;

  const EmptyPlaceholder({
    Key? key,
    required this.message,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = Center(
      child: Text(message),
    );

    return isExpanded ? Expanded(child: child) : child;
  }
}
