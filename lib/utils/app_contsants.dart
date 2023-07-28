
import '../data/database_helper.dart';
import '../models/car_model.dart';

class AppConstants {

 static List<CarModel> carsItems = [];

  // var carsList = [
  //   CarModel(name: "MG - 5 - 2022", image: "", kilometer: '15,000 KM', price: '700,000 LE'),
  //   CarModel(name: "Opel - Astra - 2017", image: "", kilometer: '40,500 KM', price: '450,000 LE'),
  //   CarModel(name: "Toyota - Corolla - 2023", image: "", kilometer: '6,000 KM', price: '1,200,000 LE'),
  //   CarModel(name: "Oudi - Q7 - 2019", image: "", kilometer: '88,000 KM', price: '4,550,000 LE'),
  //   CarModel(name: "Lancer - Puma - 2007", image: "", kilometer: '187,000 KM', price: '180,000 LE'),
  // ];

  Future<List<CarModel>> getcarsList() async {
      carsItems.clear();
      carsItems.addAll(await DatabaseHelper.instance.getAllCars());
      return carsItems;
  }
}



