import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hint;
  final bool isPassword;
  final int minLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const AppTextField({
    super.key,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    required this.hint,
    this.isPassword = false,
    this.minLines = 1,
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    InputBorder border = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.lightGrey),
      borderRadius: BorderRadius.circular(16),
    );

    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        border: border,
        enabledBorder: border,
        errorBorder: border,
        focusedBorder: border,
        filled: true,
        fillColor: AppColors.white,
        prefixIcon: prefixIcon,
        suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : suffixIcon,
        prefixIconConstraints: BoxConstraints(
          maxWidth: 24,
          maxHeight: 24,
          minHeight: 24,
          minWidth: 24,
        ),
      ),
      validator: validator,
      controller: controller,
      minLines: minLines,
      maxLines: minLines,
      obscureText: isPassword,
    );
  }
}
