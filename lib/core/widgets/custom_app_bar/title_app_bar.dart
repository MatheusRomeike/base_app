import 'package:flutter/material.dart';

class TitleAppBar extends StatelessWidget {
  final String title;

  const TitleAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
    );
  }
}
