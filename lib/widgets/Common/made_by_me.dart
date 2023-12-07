import 'package:flutter/material.dart';

class MadeByMe extends StatelessWidget {
  const MadeByMe({super.key});

  @override
  Widget build(BuildContext context) {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;
    return Padding(
      padding: EdgeInsets.only(bottom: devicePadding.bottom + 50 + 5),
      child: Center(
        child: Text(
          'Made with ❤️ by Parth',
          style: TextStyle(color: Colors.white.withAlpha(150), fontSize: 10),
        ),
      ),
    );
  }
}