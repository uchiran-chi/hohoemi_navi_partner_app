import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// TODO: statefulとstateless

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
        Text(widget.text, textAlign: TextAlign.left),
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
