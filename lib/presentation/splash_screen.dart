import 'package:flutter/material.dart';
import '../data/shared_pref.dart';
import '../utils/app_contsants.dart';
import '../utils/colors.dart';
import '../utils/navigation.dart';
import 'home_page.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  

  @override
  Widget build(BuildContext context) {  
    
    Future.delayed(
      const Duration(seconds: 3),
      () => checkIfUserLoggedIn(context)
    );

    return const Scaffold(
      backgroundColor: AppColors.colorBlue500Base,
      body: Center(
        child: Image(image: AssetImage("assets/cc_logo_white.png")),
      ),
    );
  }

  void checkIfUserLoggedIn(BuildContext context) async {

    await AppConstants().getcarsList();

    bool isLoggedIn = await SharedPref.getBool('is_logged_in') ?? false;

    if(isLoggedIn == true){
      // ignore: use_build_context_synchronously
      navigatoTo(context: context, screen: const HomePage());
    }
    else {
      // ignore: use_build_context_synchronously
      navigatoTo(context: context, screen: const LoginScreen());
    }
  }
  

}