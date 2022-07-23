import 'package:get/get.dart';

class MyController extends GetxController {
  //var pageNumber = 1.obs;
  var totalImage = 12.obs;
  var searchValue = "wallpaper".obs;
  RxList<String> imagesList = List<String>.from([]).obs;

  increaseListIteamNumber() {
    totalImage = totalImage + 12;
  }

  clearTotalImageValue() {
    totalImage = 12.obs;
  }

  //increasePageNumber() => pageNumber++;

  // updateImageList(List<String> newList) {
  //   imagesList.addAll(newList);
  // }
}
