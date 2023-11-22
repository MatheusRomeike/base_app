import 'package:base_app/core/entities/carousel_header_option.dart';
import 'package:flutter/material.dart';

import '../enums/caroulsel_view.dart';

class CustomCarouselBuilder {
  final double? height;
  final double viewportFraction;
  final CarouselView carouselView;
  final Function()? onPageClick;
  final List<CarouselHeaderOption>? carouselHeaderOption;
  final List<Widget>? itens;
  final Axis scrollDirection;

  CustomCarouselBuilder({
    this.height,
    this.viewportFraction = 0.95,
    this.carouselView = CarouselView.indicator,
    this.onPageClick,
    this.carouselHeaderOption,
    this.itens,
    this.scrollDirection = Axis.horizontal,
  });
}
