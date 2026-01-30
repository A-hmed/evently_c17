import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hint;
  final bool isPassword;
  final int minLines;

  const AppTextField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    required this.hint,
    this.isPassword = false,
    this.minLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    InputBorder border = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.lightGrey),
      borderRadius: BorderRadius.circular(16),
    );

    return TextField(
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
      minLines: minLines,
      maxLines: minLines + 1,
      onChanged: (text) {
        print("text");
      },
      obscureText: isPassword,
    );
  }
}
