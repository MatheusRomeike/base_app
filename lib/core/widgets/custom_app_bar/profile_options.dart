import 'package:flutter/material.dart';

class ProfileOptions {
  ProfileOptions();

  showProfileOptions(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          buttonPadding: EdgeInsets.zero,
          actions: [],
        );
      },
    );
  }
}
