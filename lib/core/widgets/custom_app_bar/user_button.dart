import 'package:flutter/material.dart';

import 'profile_options.dart';

class UserButton extends StatelessWidget {
  final String? backRoute;
  final Function()? backOnTap;

  const UserButton({Key? key, this.backRoute, this.backOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ProfileOptions().showProfileOptions(context),
      child: const CircleAvatar(
        radius: 16,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage('assets/icons/user.png'),
      ),
    );
  }
}
