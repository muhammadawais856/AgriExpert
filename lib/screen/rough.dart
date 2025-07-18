import 'package:flutter/material.dart';

class HighlightTextField extends StatefulWidget {
  @override
  _HighlightTextFieldState createState() => _HighlightTextFieldState();
}

class _HighlightTextFieldState extends State<HighlightTextField> {
  final TextEditingController name = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {}); // ✅ Trigger rebuild when focus changes
    });
  }

  @override
  void dispose() {
    name.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isFocused = _focusNode.hasFocus;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: isFocused ? Color(0xFF339D44) : Color(0xFFB4B4B4),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: name,
            focusNode: _focusNode,
            cursorColor: Color(0xFF339D44),
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "Name",
              labelStyle: TextStyle(
                fontSize: 13.33,
                fontWeight: FontWeight.w400,
                fontFamily: 'Raleway',
                color: isFocused ? Color(0xFF339D44) : Color(0xFFB4B4B4),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
