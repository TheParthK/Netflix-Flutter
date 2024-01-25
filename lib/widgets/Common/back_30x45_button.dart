import 'package:flutter/material.dart';

class Back30x45Button extends StatelessWidget {
  final VoidCallback backFunction;
  const Back30x45Button({super.key, required this.backFunction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(7)),
      splashColor: Colors.grey.withAlpha(150),
      onTap: backFunction,
      child: const SizedBox(
        width: 30,
        height: 45,
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
    );
  }
}