import 'package:flutter/material.dart';

class SnackbarUtil {
  // ✅ Success Snackbar
  static void showSuccess(BuildContext context, String message) {
    _showAnimatedSnackbar(
      context,
      title: 'Success',
      message: message,
      bgColor: Colors.green.shade600,
    );
  }

  // ❌ Error Snackbar
  static void showError(BuildContext context, String message) {
    _showAnimatedSnackbar(
      context,
      title: 'Error',
      message: message,
      bgColor: Colors.red.shade600,
    );
  }

  // ⚠️ Warning Snackbar
  static void showWarning(BuildContext context, String message) {
    _showAnimatedSnackbar(
      context,
      title: 'Warning',
      message: message,
      bgColor: Colors.orange.shade600,
    );
  }

  // 🧩 Core Animated Snackbar
  static void _showAnimatedSnackbar(
      BuildContext context, {
        required String title,
        required String message,
        required Color bgColor,
      }) {
    final overlay = Overlay.of(context);
    if (overlay == null) return;

    late OverlayEntry overlayEntry;
    final animationController = AnimationController(
      vsync: Navigator.of(context),
      duration: const Duration(milliseconds: 400),
    );
    final animation =
    Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOutBack,
    ));

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 10,
        left: 16,
        right: 16,
        child: SlideTransition(
          position: animation,
          child: Material(
            elevation: 6,
            borderRadius: BorderRadius.circular(12),
            color: Colors.transparent,
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: bgColor.withOpacity(0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Text(
                    '$title: ',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      message,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);
    animationController.forward();

    // Remove after delay with slide-up animation
    Future.delayed(const Duration(seconds: 3), () async {
      await animationController.reverse();
      overlayEntry.remove();
      animationController.dispose();
    });
  }
}
