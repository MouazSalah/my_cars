import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/home_page.dart';
import 'package:flutter_application_1/utils/app_contsants.dart';
import '../data/database_helper.dart';
import '../models/car_model.dart';
import '../utils/colors.dart';
import '../utils/navigation.dart';

class AddCarScreen extends StatefulWidget {

  final CarModel? carModel;

  const AddCarScreen({super.key, this.carModel});

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {

  var name = TextEditingController();
  String errorNameMessage = "من فضلك ادخل اسم العربية";
  bool isShowNameError = false;

  var price = TextEditingController();
  String errorPriceMessage = "من فضلك ادخل سعر العربية";
  bool isShowPriceError = false;

  var kilometer = TextEditingController();
  String errorKilometerMessage = "من فضلك ادخل عدد الكيلومترات";
  bool isShowKilometerError = false;


  @override
  void initState() {
  
    name.text = widget.carModel?.name.toString() ?? "";
    price.text = widget.carModel?.price.toString() ?? "";
    kilometer.text = widget.carModel?.kilometer.toString() ?? "";
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

  
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colorNeutral200,
        title: const Text(
          "Add New Car",
          style: TextStyle(
              color: AppColors.colorBlue700, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          color: AppColors.colorLightGrey,
          margin: const EdgeInsets.all(24),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "اسم العربية",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.colorBoldBlue,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 65,
                child: TextField(
                  controller: name,
                  textDirection: TextDirection.rtl,
                  cursorColor: AppColors.colorBlue500Base,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintTextDirection: TextDirection.rtl,
                    hintText:
                        "اكتب معلومات عن العربية زي الماركة والموديل وسنة الصنع",
                    hintStyle: TextStyle(
                      color: AppColors.colorDarkBlue400,
                      fontSize: 11,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: AppColors.colorDarkBlue100), //<-- SEE HERE
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: AppColors.colorDarkBlue100), //<-- SEE HERE
                    ),
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: AppColors.colorBlue500Base,
                  ),
                ),
              ),
              Visibility(
                visible: isShowNameError,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    errorNameMessage,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.colorError500Base,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "سعر العربية",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.colorBoldBlue,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 65,
                child: TextField(
                  controller: price,
                  textDirection: TextDirection.rtl,
                  cursorColor: AppColors.colorBlue500Base,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintTextDirection: TextDirection.rtl,
                    hintText: "السعر",
                    hintStyle: TextStyle(
                      color: AppColors.colorDarkBlue400,
                      fontSize: 11,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: AppColors.colorDarkBlue100), //<-- SEE HERE
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: AppColors.colorDarkBlue100), //<-- SEE HERE
                    ),
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: AppColors.colorBlue500Base,
                  ),
                ),
              ),
              Visibility(
                visible: isShowPriceError,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    errorPriceMessage,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.colorError500Base,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "عدد الكيلومترات",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.colorBoldBlue,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 65,
                child: TextField(
                  controller: kilometer,
                  textDirection: TextDirection.rtl,
                  cursorColor: AppColors.colorBlue500Base,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintTextDirection: TextDirection.rtl,
                    hintText: "ادخل عدد الكيلومترات",
                    hintStyle: TextStyle(
                      color: AppColors.colorDarkBlue400,
                      fontSize: 11,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: AppColors.colorDarkBlue100), //<-- SEE HERE
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: AppColors.colorDarkBlue100), //<-- SEE HERE
                    ),
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: AppColors.colorBlue500Base,
                  ),
                ),
              ),
              Visibility(
                visible: isShowKilometerError,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    errorKilometerMessage,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.colorError500Base,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // if (name.text.toString().isEmpty) {
                    //   errorNameMessage =
                    //       "من فضلك ادخل اسم الماركة والموديل وسنة الصنع ";
                    //   isShowNameError = true;
                    // } else {
                    //   isShowNameError = false;
                    // }

                    // if (price.text.toString().isEmpty) {
                    //   errorPriceMessage = "من فضلك ادخل سعر العربية";
                    //   isShowPriceError = true;
                    // }
                    // // else if ((price.text.toString() as int ) < 5000)
                    // // {
                    // //     errorPriceMessage = "سعر العربية لا يجب ان تكون اقل من 5000";
                    // //     isShowPriceError = true;
                    // // }
                    // else {
                    //   isShowPriceError = false;
                    // }

                    // if (kilometer.text.toString().isEmpty) {
                    //   errorKilometerMessage = "من فضلك ادخل عدد الكيلومترات";
                    //   isShowKilometerError = true;
                    // }
                    // // else if ((kilometer.text.toString() as int ) < 5000)
                    // // {
                    // //     errorKilometerMessage = "عداد الكيلومترات لا يجب ان تكون اقل من 5000 كيلومتر";
                    // //     isShowKilometerError = true;
                    // // }
                    // else {
                    //   isShowKilometerError = false;
                    // }

                    insertCarItem();
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: AppColors.colorOrange500Base,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                  child: const Text(
                    "أضف العربية",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.colorWhite900,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40)
            ],
          ),
        ),
      ),
    );
  }

  void insertCarItem() async {

    if(widget.carModel?.name != null)
    {
       await DatabaseHelper.instance.deleteItem(widget.carModel?.name ?? "");
    }

    CarModel item = CarModel(
        name: name.text.toString(),
        price: price.text.toString(),
        kilometer: kilometer.text.toString(),
        image: 'image_url');
    await DatabaseHelper.instance.insert(item);

    await AppConstants().getcarsList();
    
    setState(() {});

    // ignore: use_build_context_synchronously
    navigatoTo(context: context, screen: const HomePage());
  }
}
