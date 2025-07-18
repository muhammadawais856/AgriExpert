import 'package:flutter/material.dart';

class FloatingLabelInsideField extends StatefulWidget {
  const FloatingLabelInsideField({super.key});

  @override
  State<FloatingLabelInsideField> createState() => _FloatingLabelInsideFieldState();
}

class _FloatingLabelInsideFieldState extends State<FloatingLabelInsideField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  bool get _shouldFloat => _focusNode.hasFocus || _controller.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => setState(() {}));
    _focusNode.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          // TextField underneath
          TextField(
            controller: _controller,
            focusNode: _focusNode,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintText: '', // We use our own label
              contentPadding: const EdgeInsets.fromLTRB(12, 24, 12, 12), // create space
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFD4D4D4)),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFF339D44), width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),

          // Floating Label on top
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            left: 16,
            top: _shouldFloat ? 6 : 26, // float up, but remain inside
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                fontSize: _shouldFloat ? 11 : 14,
                color: _shouldFloat ? const Color(0xFF339D44) : const Color(0xFFB4B4B4),
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w400,
              ),
              child: const Text("Name"),
            ),
          ),
        ],
      ),
    );
  }
}
