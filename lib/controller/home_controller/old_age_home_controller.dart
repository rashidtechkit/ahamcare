import 'package:flutter/material.dart';

class OldAgeHomeController extends ChangeNotifier {
  final TextEditingController needsController = TextEditingController();

  bool isLoading = false;
  int totalAmount = 100;
  bool isChecked = false;
  Map<int, bool> selectedFlag = {};
  bool isSelectionMode = false;
  List<bool> isCheckedList = [];

  // Future<void> getOldAgeHome(context) async {
  //   isLoading = true;
  //   notifyListeners();
  //   await OldAgeHomeService().oldAgeHomeService(context).then(
  //     (value) {
  //       if (value != null) {
  //         oldAgeList = value;
  //         notifyListeners();
  //         isLoading = false;
  //         notifyListeners();
  //       } else {
  //         isLoading = false;
  //         notifyListeners();
  //         return null;
  //       }
  //     },
  //   );
  //   isLoading = false;
  //   notifyListeners();
  // }

  // void onChange(data, index) {
  //   int count = 0;
  //   isCheckedList = List.generate(
  //       oldAgeList[index].requirement.requirement.length, (index) => false);
  //   isCheckedList[index] = data;
  //   log(isCheckedList.toString());
  //   for (var i = 0; i < oldAgeList[i].requirement.requirement.length; i++) {
  //     if (isCheckedList[i] == true) {
  //       count = count + oldAgeList[i].requirement.requirement[i].price;
  //     }
  //   }
  //   log(count.toString());
  //   totalAmount = count;
  //   notifyListeners();
  // }
}
