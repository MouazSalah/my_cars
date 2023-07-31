
import '../data/database_helper.dart';
import '../models/car_model.dart';

class AppConstants {

 static List<CarModel> carsItems = [];

  Future<List<CarModel>> getcarsList() async {
      carsItems.clear();
      carsItems.addAll(await DatabaseHelper.instance.getAllCars());
      return carsItems;
  }
}



