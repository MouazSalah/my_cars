import 'package:flutter/material.dart';
import '../utils/colors.dart';

class ButtonWithIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;
  final String label;

  const ButtonWithIcon({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(
        label,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: AppColors.colorBlue500Base,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor:
            Colors.white, 
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        elevation: 0,
      ),
    );
  }
}
