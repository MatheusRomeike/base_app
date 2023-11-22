import 'package:flutter/material.dart';

class CarouselIndicator extends StatelessWidget {
  final int currentIndex;
  final int length;

  const CarouselIndicator({
    super.key,
    required this.currentIndex,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < length; i++)
          Container(
            width: 7.0,
            height: 7.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentIndex == i ? Colors.red.shade700 : Colors.grey,
            ),
          ),
      ],
    );
  }
}
