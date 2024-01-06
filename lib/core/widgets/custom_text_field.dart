import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String hint;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.obscureText = false,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        label: Text(hint),
        border: _buildInputBorder(Colors.black),
        enabledBorder: _buildInputBorder(Colors.black),
        focusedBorder: _buildInputBorder(Theme.of(context).colorScheme.primary),
        disabledBorder: _buildInputBorder(Colors.grey),
        errorBorder: _buildInputBorder(Colors.red),
        focusedErrorBorder: _buildInputBorder(Colors.red),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 25.w,
          vertical: 15.h,
        ),
      ),
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      obscureText: obscureText,
      style: TextStyle(
        fontSize: 18.sp,
        color: Colors.black,
      ),
    );
  }

  OutlineInputBorder _buildInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.r),
      borderSide: BorderSide(color: color, width: 1.r),
    );
  }
}
