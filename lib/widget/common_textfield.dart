import 'package:bank_management/constant/my_color.dart';
import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String labelText;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: MyColor.main,
      controller: controller,
      textAlign: TextAlign.start,
      style: const TextStyle(fontSize: 15, color: Colors.black),
      onChanged: onChanged,
      decoration: InputDecoration(
          labelText: labelText,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.only(left: 20, right: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: MyColor.main),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: MyColor.main),
          ),
          labelStyle: TextStyle(color: Colors.black)

          //fillColor: Colors.green
          ),
      keyboardType: TextInputType.text,
    );
  }
}
