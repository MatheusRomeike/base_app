import 'package:flutter/material.dart';
import '../../../entities/carousel_header_option.dart';

class CarouselHeader extends StatelessWidget {
  final int currentIndex;
  final List<CarouselHeaderOption> carouselHeaderOption;
  final Function(int index) changePage;

  const CarouselHeader({
    Key? key,
    required this.currentIndex,
    required this.carouselHeaderOption,
    required this.changePage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth / carouselHeaderOption.length;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < carouselHeaderOption.length; i++)
            GestureDetector(
              onTap: () => changePage(i),
              child: Container(
                width: buttonWidth,
                margin: const EdgeInsets.only(bottom: 4.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: currentIndex == i
                          ? Colors.red.shade700
                          : Colors.transparent,
                      width: 4,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Text(
                    carouselHeaderOption[i].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:
                          currentIndex == i ? Colors.red.shade700 : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
