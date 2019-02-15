import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return new  TextField(
      textAlign: TextAlign.center,
      decoration: new InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
        prefixIcon: new Icon(Icons.search),
        prefixStyle: TextStyle(color: Colors.grey),
        hintText: '移动开发',
        filled: true,
        fillColor: Color(0xffaaaaaa),
        border: new OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none
        ),
      ),
    );
  }
}