import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_svg/svg.dart';

class EmptyView extends StatelessWidget {

    final Function() whenAddClicked;

  const EmptyView({super.key, required this.whenAddClicked});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 150), // Equivalent to layout_marginTop in XML
          SvgPicture.asset('assets/empty_state.svg', height: 200, width: 200),
          const SizedBox(height: 24), // Equivalent to layout_marginTop in XML
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'عفواً لا يوجد اعلانات خاصة بك',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17, // Replace with your desired font size
                color: AppColors
                    .colorDarkBlue900, // Replace with your desired color
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12), // Equivalent to layout_marginTop in XML
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'يمكنك إضافة اعلان الآن بكل سهولة',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15, // Replace with your desired font size
                color: AppColors
                    .colorDarkBlue500Base, // Replace with your desired color
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24), // Equivalent to layout_marginTop in XML
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ElevatedButton.icon(
              onPressed: () {
                // handle button press
                whenAddClicked();
              },
              icon: const Icon(
                Icons.add, // replace with your icon
                size: 20.0,
                color: AppColors.colorWhite900,
              ),
              label: const Text(
                'إضافة عربية جديدة', // replace with your text
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  fontFamily: 'Cairo', // replace with your font
                  fontWeight: FontWeight.bold, // adjust according to your font
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    AppColors.colorBlue500Base), // adjust your color
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                   const EdgeInsets.symmetric(vertical : 14, horizontal: 36)),
                elevation: MaterialStateProperty.all<double>(0),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
