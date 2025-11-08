import 'package:flutter/material.dart';

class SnackbarUtil {
  // Success
  static void showSuccess(BuildContext context, String message) {
    _showTopSnackbar(context, message, Colors.green.shade600, 'Success');
  }

  // Error
  static void showError(BuildContext context, String message) {
    _showTopSnackbar(context, message, Colors.red.shade600, 'Error');
  }

  // Warning
  static void showWarning(BuildContext context, String message) {
    _showTopSnackbar(context, message, Colors.orange.shade600, 'Warning');
  }

  // Private function for top snackbar
  static void _showTopSnackbar(
      BuildContext context, String message, Color bgColor, String title) {
    final overlay = Overlay.of(context);

    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 40,
        left: 16,
        right: 16,
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Text(
                  '$title: ',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () => overlayEntry.remove(),
                  child: const Icon(Icons.close, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }
}
