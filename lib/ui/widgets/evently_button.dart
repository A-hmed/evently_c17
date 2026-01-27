import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class EventlyButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final TextStyle textStyle;
  final Widget? icon;
  final VoidCallback onPress;

  const EventlyButton({
    super.key,
    required this.text,
    required this.onPress,
    this.backgroundColor = AppColors.blue,
    this.textStyle = AppTextStyles.white18Medium,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    // var x = <int>[1, 2, 3, if(true) 4, ...[11232, 22323, 3]];
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[icon!, SizedBox(width: 16)],
          Text(text, style: textStyle),
        ],
      ),
    );
  }
}
