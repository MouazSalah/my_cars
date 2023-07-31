import 'package:flutter/material.dart';

void navigatoTo({required context, required screen}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));

void navigatoToWithBundle({required context, required screen, required data}) =>
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => screen(data)));
