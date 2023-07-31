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
          const SizedBox(height: 150), 
          SvgPicture.asset('assets/empty_state.svg', height: 200, width: 200),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'عفواً لا يوجد اعلانات خاصة بك',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17, 
                color: AppColors
                    .colorDarkBlue900, 
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12), 
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'يمكنك إضافة اعلان الآن بكل سهولة',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15, 
                color: AppColors
                    .colorDarkBlue500Base, 
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24), 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ElevatedButton.icon(
              onPressed: () {
                whenAddClicked();
              },
              icon: const Icon(
                Icons.add, 
                size: 20.0,
                color: AppColors.colorWhite900,
              ),
              label: const Text(
                'إضافة عربية جديدة', 
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  fontFamily: 'Cairo', 
                  fontWeight: FontWeight.bold, 
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    AppColors.colorBlue500Base), 
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
