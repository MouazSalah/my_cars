import 'package:flutter/material.dart';

import '../models/car_model.dart';
import '../utils/colors.dart';

class ItemCarWidget extends StatelessWidget {

  final CarModel carItem;
  final Function(CarModel) whenDeleteClicked;
  final Function(CarModel) whenEditClicked;
  const ItemCarWidget({super.key, required this.carItem, required this.whenDeleteClicked, required this.whenEditClicked});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        child: Row(
          children:  [
            const Visibility(
              visible: false,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.transparent,
               // backgroundImage: AssetImage("assets/mouaz.jpeg"),
              ),
            ),
            const SizedBox(width: 15),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    carItem.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.colorBlue700,
                    ),
                  ),
                    Text(
                    "${carItem.kilometer} KM - ${carItem.price} LE",
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: AppColors.colorBlue700,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: (){
                          whenEditClicked(carItem);
                      
                    }, icon: const Icon(Icons.edit)),
                    IconButton(onPressed: (){
                          whenDeleteClicked(carItem);
                      
                    }, icon: const Icon(Icons.delete))
                  ],
                )),
            )
          ],
        ),
      ),
    );
  }
}
