import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../entities/custom_carousel_builder.dart';
import '../../state/app_state.dart';
import '../../state/app_state_builder.dart';
import 'carousel_body.dart';

class Carousel extends StatefulWidget {
  final CustomCarouselBuilder builder;

  const Carousel({super.key, required this.builder});

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late final CustomCarouselBuilder builder;
  final AppState<int> currentIndex = AppState<int>.init(0);
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
    builder = widget.builder;
  }

  @override
  Widget build(BuildContext context) {
    return AppStateBuilder(
        state: currentIndex,
        builder: (_, currentIndex) {
          final index = currentIndex.data ?? 0;
          return CarouselBody(
            builder: builder,
            currentIndex: index,
            changePage: _changePage,
            controller: _controller,
          );
        });
  }

  _changePage(int index) {
    currentIndex.value = index;
    _controller.jumpToPage(index);
  }

  @override
  void dispose() {
    currentIndex.dispose();
    super.dispose();
  }
}
