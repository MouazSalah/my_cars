
class CarModel {

  String name;
  String price;
  String kilometer;
  String image;

  CarModel({
    required this.name,
    required this.price,
    required this.kilometer,
    required this.image,
  });

 Map<String, dynamic> toMap(CarModel item) => {
        'name': item.name,
        'price': item.price,
        'kilometer': item.kilometer,
        'image': item.name
      };

  static CarModel fromMap(Map<String, dynamic> map) {
    return CarModel(
      name: map['name'],
      image: map['image'],
      kilometer: map['kilometer'],
      price: map['price'],
    );
  }
}


