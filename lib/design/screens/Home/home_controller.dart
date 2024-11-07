import 'package:get/get.dart';

class HomeController extends GetxController{
  bool isLoading=false;
  Future<void>fetchData()async {
    isLoading=true;
    update();
    print(isLoading);
    await  Future.delayed(Duration(seconds: 10));
    isLoading=false;
    update();
    print(isLoading);
  }
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

}