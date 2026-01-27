import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showLoading(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        content: Row(
          children: [Text("Loading..."), Spacer(), CircularProgressIndicator()],
        ),
      );
    },
  );
}

showMessage(
  BuildContext context,
  String message, {
  String? title,
  String? posText,
  Function? onPosClick,
  String? negText,
  Function? onNegClick,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: title != null ? Text(title) : null,
        content: Text(message),
        actions: [
          if (posText != null)
            TextButton(
              onPressed: () {
                onPosClick?.call();
                Navigator.pop(context);
              },
              child: Text(posText),
            ),
          if (negText != null)
            TextButton(
              onPressed: () {
                onNegClick?.call();
                Navigator.pop(context);
              },
              child: Text(negText),
            ),
        ],
      );
    },
  );
}
