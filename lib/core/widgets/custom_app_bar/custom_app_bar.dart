import 'package:base_app/core/widgets/custom_app_bar/user_button.dart';
import 'package:flutter/material.dart';

import '../../../injectors.dart';
import '../../navigator/app_navigator_interface.dart';
import 'back_button.dart';
import 'title_app_bar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? backRoute;
  final AppNavigatorInterface navigator = getIt();

  CustomAppBar({required this.title, this.backRoute});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        AppBar(
          toolbarHeight: 45,
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          titleSpacing: 27,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  BackButtonAppBar(backRoute: backRoute, backOnTap: _backOnTap),
                  TitleAppBar(title: title)
                ],
              ),
              const UserButton()
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);

  void _backOnTap() => navigator.pushReplacement(backRoute!);
}
