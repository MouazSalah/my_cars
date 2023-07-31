import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/database_helper.dart';
import '../bottom_sheet.dart';
import '../models/car_model.dart';
import '../utils/app_contsants.dart';
import '../utils/colors.dart';
import '../utils/navigation.dart';
import '../widgets/empty_view.dart';
import '../widgets/item_car_widget.dart';
import 'add_car.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void whenCarItemDeleted(CarModel carItem) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ConfirmBottomSheet(onConfirm: () async {
          await DatabaseHelper.instance.deleteItem(carItem.name);
          AppConstants.carsItems
              .removeWhere((element) => element.name == carItem.name);
          setState(() {});
        });
      },
    );
  }

  void wheneditClicked(CarModel carItem) {
      navigatoTo(context: context, screen: AddCarScreen(carModel: carItem,));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colorNeutral200,
        title: const Text(
          "My Cars",
          style: TextStyle(
              color: AppColors.colorBlue700, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {

         // getImage();
          navigatoTo(context: context, screen: const AddCarScreen());
        },
      ),
      body: AppConstants.carsItems.isEmpty
          ? Center(
            child: SizedBox( width : double.infinity, 
            height : double.infinity,
            child: EmptyView(whenAddClicked: (){
              navigatoTo(context: context, screen: const AddCarScreen());
            },)),
          ) // Show EmptyView when there is no data
          : ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: AppConstants.carsItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemCarWidget(
                    carItem: AppConstants.carsItems[index],
                    whenDeleteClicked: whenCarItemDeleted, whenEditClicked: wheneditClicked);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
    );
  }
}
