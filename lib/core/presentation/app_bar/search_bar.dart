import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(right: 10, top: 6, bottom: 8),
        isCollapsed: true,
        floatingLabelAlignment: FloatingLabelAlignment.center,
        constraints: const BoxConstraints(
          maxHeight: 30,
        ),
        hintText: 'Search',
        hintStyle: const TextStyle(
          color: Colors.grey,
          // fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.black,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color(0xFFE4E4E4),
      ),
    );
  }
}
