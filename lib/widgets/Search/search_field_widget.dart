import 'package:flutter/material.dart';

class SearchFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final VoidCallback searchFunction;
  const SearchFieldWidget({super.key, required this.textEditingController, required this.searchFunction});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: TextField(
          controller: textEditingController,
          onChanged: (value) => searchFunction(),
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.black,
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey.withAlpha(150)),
          ),
          cursorColor: Colors.white,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}