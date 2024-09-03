import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool isNumberInput;
  final bool allowDecimal;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final EdgeInsets contentPadding;

  const MyTextField({
    Key? key,
    required this.controller,
    this.hintText,
    this.isNumberInput = false,
    this.allowDecimal = false,
    this.enabledBorderColor = const Color(0xFF000000),
    this.focusedBorderColor = const Color(0xFF777777),
    this.contentPadding = const EdgeInsets.only(top: 5, left: 15, bottom: -12),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: enabledBorderColor, width: 1),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor, width: 1),
        ),
        contentPadding: contentPadding,
      ),
      keyboardType: isNumberInput
          ? TextInputType.numberWithOptions(decimal: allowDecimal)
          : TextInputType.text,
      inputFormatters: isNumberInput
          ? <TextInputFormatter>[
        FilteringTextInputFormatter.allow(
          allowDecimal ? RegExp(r'^\d*\.?\d*$') : RegExp(r'^\d*$'),
        ),
      ]
          : null,
    );
  }
}