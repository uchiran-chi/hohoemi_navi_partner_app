import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatefulWidget {
  final String text;
  final TextEditingController controller;

  InputField({super.key, required this.text, required this.controller});

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        TextField(controller: widget.controller),
      ],
    );
  }
}

class InputNumberField extends StatefulWidget {
  final String text;
  final TextEditingController controller;

  InputNumberField({super.key, required this.text, required this.controller});

  @override
  _InputNumberFieldState createState() => _InputNumberFieldState();
}

class _InputNumberFieldState extends State<InputNumberField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.text, textAlign: TextAlign.left),
        TextField(
            controller: widget.controller,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
      ],
    );
  }
}

class InputFieldMultiLines extends StatefulWidget {
  final String text;
  final TextEditingController controller;

  InputFieldMultiLines(
      {super.key, required this.text, required this.controller});

  @override
  _InputFieldMultiLinesState createState() => _InputFieldMultiLinesState();
}

class _InputFieldMultiLinesState extends State<InputFieldMultiLines> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.text, textAlign: TextAlign.left),
        Container(
          height: 200,
          child: TextField(
            textAlignVertical: TextAlignVertical.top,
            controller: widget.controller,
            style: TextStyle(
              fontSize: 16,
            ),
            keyboardType: TextInputType.multiline,
            maxLines: null,
            expands: true,
          ),
        )
      ],
    );
  }
}
