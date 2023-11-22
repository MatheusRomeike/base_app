import 'package:flutter/material.dart';

class BackButtonAppBar extends StatelessWidget {
  final String? backRoute;
  final Function()? backOnTap;

  const BackButtonAppBar({Key? key, this.backRoute, this.backOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (backRoute == null) return SizedBox.shrink();
    return Row(
      children: [
        GestureDetector(
          onTap: backOnTap,
          child: Image.asset(
            'assets/icons/back_page.png',
            width: 18,
          ),
        ),
        const SizedBox(width: 5)
      ],
    );
  }
}
