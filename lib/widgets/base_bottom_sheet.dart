import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';

class BaseBottomSheet extends StatefulWidget {
  final String imageAsset;
  final String title;
  final String description;
  final String cancelButtonText;
  final String confirmButtonText;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const BaseBottomSheet({
    Key? key,
    required this.imageAsset,
    required this.title,
    required this.description,
    required this.cancelButtonText,
    required this.confirmButtonText,
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);

  @override
  State<BaseBottomSheet> createState() => _BaseBottomSheetState();
}

class _BaseBottomSheetState extends State<BaseBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 36),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(width: 70, image: AssetImage(widget.imageAsset)),
            const SizedBox(height: 20),
            Text(
              widget.title,
              style: TextStyle(
                color: AppColors.colorBlue500Base,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.description,
              style: TextStyle(
                color: AppColors.colorDarkBlue500Base,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    widget.onCancel();
                    Navigator.pop(context);
                  },
                  child: Text(widget.cancelButtonText),
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.onConfirm();
                    Navigator.pop(context);
                  },
                  child: Text(widget.confirmButtonText),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
