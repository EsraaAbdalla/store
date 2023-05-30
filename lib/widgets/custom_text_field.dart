import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.onChange,
      this.hintText,
      this.obscureText = false,
      this.inputType});
  Function(String)? onChange;
  String? hintText;
  bool? obscureText;
  TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      keyboardType: inputType,
      // validator: (data) {
      //   if (data!.isEmpty) {
      //     return 'field is required';
      //   }
      // },
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
