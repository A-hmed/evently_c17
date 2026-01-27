import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:evently_c17/ui/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hint;
  final bool isPasswordField;

  const AppTextField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    required this.hint,
    this.isPasswordField = false,
  });

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.lightGrey, width: 1),
    );
    return TextField(
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hint,
        hintStyle: AppTextStyles.grey14Regular,
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        disabledBorder: border,
        focusedErrorBorder: border,
        errorBorder: border,
        fillColor: AppColors.white,
        suffixIconConstraints: BoxConstraints(
          maxHeight: 24,
          maxWidth: 24
        ),
        prefixIconConstraints: BoxConstraints(
            maxHeight: 24,
            maxWidth: 24
        ),
        filled: true
      ),
      obscureText: isPasswordField,
    );
  }
}
