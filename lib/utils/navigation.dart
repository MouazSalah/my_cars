import 'package:flutter/material.dart';

void navigatoTo({required context, required screen}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));

void navigatoToWithBundle({required context, required screen, required data}) =>
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => screen(data)));

extension NavigationExtension on BuildContext {
  void navigateTo(Widget screen) {
    Navigator.of(this).push(
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  void navigateToReplacement(Widget screen) {
    Navigator.of(this).pushReplacement(
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  void navigateToNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  void navigateToNamedReplacement(String routeName, {Object? arguments}) {
    Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }

  void navigateToNamedAndRemoveUntil(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  void navigateBack() {
    Navigator.of(this).pop();
  }
}
