import 'package:flutter/material.dart';

class SnackBarManager {
  // Singleton pattern to ensure only one instance of SnackBarManager is used
  static final SnackBarManager _instance = SnackBarManager._internal();

  // Private constructor
  SnackBarManager._internal();

  factory SnackBarManager() {
    return _instance;
  }

  // Method to show a SnackBar
  void showSnackBar({
    required BuildContext context,
    required String message,
    Color backgroundColor = Colors.black87,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    // Remove any current SnackBars
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    // Show new SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: backgroundColor,
        duration: duration,
        action: action,
      ),
    );
  }
}
