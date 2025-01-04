import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:iconsax/iconsax.dart';

class FLoaders {
  static hideSnackBar(BuildContext context) =>
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

  static customToast(BuildContext context, {required message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        duration: const Duration(seconds: 3),
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey.withOpacity(0.9),
          ),
          child: Center(
            child: Text(
              message,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ),
      ),
    );
  }

  /// Shows a success snackbar.
  ///
  /// [context] The BuildContext to access the ScaffoldMessenger.
  /// [title] The main message to display.
  /// [message] Optional additional message (shown below the title).
  /// [duration] Duration the snackbar should be displayed (in seconds).
  /// [icon] Optional custom icon (defaults to Iconsax.check).
  /// [backgroundColor] Optional custom background color (defaults to TColors.primary).
  static void successSnackBar({
    required BuildContext context,
    required String title,
    String message = '',
    int duration = 3,
    IconData icon = Iconsax.copy_success,
    Color? backgroundColor,
  }) {
    _showSnackBar(
      context: context,
      title: title,
      message: message,
      duration: duration,
      icon: icon,
      backgroundColor: backgroundColor ?? AppColors.primaryColor,
    );
  }

  /// Shows a warning snackbar. Similar to successSnackBar, but with default orange color.
  static void warningSnackBar({
    required BuildContext context,
    required String title,
    String message = '',
    int duration = 3,
    IconData icon = Iconsax.warning_2,
  }) {
    _showSnackBar(
      context: context,
      title: title,
      message: message,
      duration: duration,
      icon: icon,
      backgroundColor: Colors.orange,
    );
  }

  /// Shows an error snackbar. Similar to successSnackBar, but with default red color.
  static void errorSnackBar({
    required BuildContext context,
    required String title,
    String message = '',
    int duration = 3,
    IconData icon = Iconsax.warning_2,
  }) {
    _showSnackBar(
      context: context,
      title: title,
      message: message,
      duration: duration,
      icon: icon,
      backgroundColor: Colors.red.shade600,
    );
  }

  /// Internal helper method to display a SnackBar with consistent styling.
  static void _showSnackBar({
    required BuildContext context,
    required String title,
    String message = '',
    required int duration,
    required IconData icon,
    required Color backgroundColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.white),
                const SizedBox(width: 8),
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            if (message.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(message),
            ],
          ],
        ),
        duration: Duration(seconds: duration),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
      ),
    );
  }
}
