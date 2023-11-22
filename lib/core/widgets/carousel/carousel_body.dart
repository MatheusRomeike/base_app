import 'package:base_app/core/widgets/carousel/carousel_modes/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../entities/carousel_header_option.dart';
import '../../entities/custom_carousel_builder.dart';
import '../../enums/caroulsel_view.dart';
import 'carousel_modes/carousel_header.dart';

class CarouselBody extends StatelessWidget {
  final CustomCarouselBuilder builder;
  final int currentIndex;
  final Function(int index) changePage;
  final CarouselController controller;

  const CarouselBody({
    Key? key,
    required this.builder,
    required this.currentIndex,
    required this.changePage,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (builder.height == null) {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (builder.carouselView == CarouselView.header) ...[
              CarouselHeader(
                currentIndex: currentIndex,
                carouselHeaderOption: builder.carouselHeaderOption ?? [],
                changePage: changePage,
              )
            ],
            Expanded(
              child: CarouselSlider(
                carouselController: controller,
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height,
                  viewportFraction: builder.viewportFraction,
                  onPageChanged: (index, reason) {
                    changePage(index);
                  },
                ),
                items: builder.carouselView != CarouselView.header
                    ? builder.itens
                    : (_createHeader(builder.carouselHeaderOption ?? [])),
              ),
            ),
            if (builder.carouselView == CarouselView.indicator) ...[
              CarouselIndicator(
                currentIndex: currentIndex,
                length: builder.itens?.length ?? 0,
              )
            ]
          ],
        ),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (builder.carouselView == CarouselView.header) ...[
            CarouselHeader(
              currentIndex: currentIndex,
              carouselHeaderOption: builder.carouselHeaderOption ?? [],
              changePage: changePage,
            )
          ],
          CarouselSlider(
            carouselController: controller,
            options: CarouselOptions(
              height: builder.height!,
              viewportFraction: builder.viewportFraction,
              onPageChanged: (index, reason) {
                changePage(index);
              },
            ),
            items: builder.carouselView != CarouselView.header
                ? builder.itens
                : (_createHeader(builder.carouselHeaderOption ?? [])),
          ),
          if (builder.carouselView == CarouselView.indicator) ...[
            CarouselIndicator(
              currentIndex: currentIndex,
              length: builder.itens?.length ?? 0,
            )
          ]
        ],
      );
    }
  }

  _createHeader(List<CarouselHeaderOption> options) {
    List<CarouselHeaderOption> sortedOptions = [...options];
    CarouselHeaderOption currentOption = sortedOptions[currentIndex];
    sortedOptions.removeAt(0);
    List<CarouselHeaderOption> finalOptions = [currentOption, ...sortedOptions];
    return finalOptions
        .map(
          (e) => ListView(
            children: [...e.itens],
          ),
        )
        .toList();
  }
}
