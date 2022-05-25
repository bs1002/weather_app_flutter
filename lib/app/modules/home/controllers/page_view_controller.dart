import 'package:get/get.dart';

class PageViewController extends GetxController {
  var currentPage = 0.obs;

  void onPageChanged(int position) {
    currentPage.value = position;
  }
}
