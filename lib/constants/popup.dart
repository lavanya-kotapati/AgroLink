import 'package:flutter/material.dart';

class AppLoader {
  static bool _isShowing = false;

  static void show(BuildContext context, {String message = "Loading..."}) {
    if (_isShowing) return;

    _isShowing = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(width: 20),
                Text(message, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        );
      },
    );
  }

  static void hide(BuildContext context) {
    if (!_isShowing) return;

    _isShowing = false;
    Navigator.of(context, rootNavigator: true).pop();
  }
}
