import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';

class ConfirmBottomSheet extends StatefulWidget {
  final VoidCallback onConfirm;

  const ConfirmBottomSheet({Key? key, required this.onConfirm})
      : super(key: key);

  @override
  State<ConfirmBottomSheet> createState() => _ConfirmBottomSheetState();
}

class _ConfirmBottomSheetState extends State<ConfirmBottomSheet> {
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
            const Image(width: 70, image: AssetImage('assets/done_icon.png')),
            const SizedBox(height: 20),
            const Text(
              'متأكد من مسح العنصر من القائمة',
              style: TextStyle(
                color: AppColors.colorBlue500Base,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'سيتم مسح العنصر ولا يمكن استرجاعه مرة اخري',
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
                    Navigator.pop(context);
                  },
                  child: const Text('الغاء'),
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.onConfirm();
                    Navigator.pop(context);
                  },
                  child: const Text('تأكيد'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
