import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  final Function() removeToken;

  const LogoutButton({Key? key, required this.removeToken}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(fixedSize: const Size(250, 40)),
      onPressed: () async => await removeToken(),
      child: const Text('Sair',
          style: TextStyle(color: Colors.black, fontSize: 16)),
    );
  }
}
