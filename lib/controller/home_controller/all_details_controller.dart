import 'dart:developer';

import 'package:ahamcare/model/home_model/get_all_details_model.dart';
import 'package:ahamcare/services/home_service/get_all_details.dart';
import 'package:flutter/material.dart';

class SelectedItem {
  int count;
  int perUnit;
  String id;
  bool checked;

  SelectedItem({
    required this.count,
    required this.perUnit,
    required this.id,
    required this.checked,
  });

  factory SelectedItem.fromJson(Map<String, dynamic> json) => SelectedItem(
        count: json["count"],
        perUnit: json["perUnit"],
        id: json["id"],
        checked: json["checked"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "perUnit": perUnit,
        "id": id,
        "checked": checked,
      };
}

class GetDetailsController extends ChangeNotifier {
  final TextEditingController needsController = TextEditingController();
  List<TextEditingController> needsControllerList = [];
  bool isLoading = false;
  int totalAmount = 0;
  bool isChecked = false;
  Map<int, bool> selectedFlag = {};
  bool isSelectionMode = false;
  AllDetailsModel? detailsList;
  List<SelectedItem> selecteditems = [];

  Future<void> getAllDetails(BuildContext context, String id) async {
    isLoading = true;
    notifyListeners();
    await GetAllDetailsService().getAllDetailsService(context, id).then(
      (value) {
        if (value != null) {
          detailsList = value;
          notifyListeners();
        } else {
          // Handle error case
          detailsList = null;
          // isCheckedList = [];
          notifyListeners();
        }
      },
    );
    isLoading = false;
    notifyListeners();
  }

  void onChange(bool? data, int index, String id) {
    final requirementIndex =
        detailsList!.requirement.indexWhere((element) => element.id == id);
    if (requirementIndex != -1) {
      final isExist = selecteditems.indexWhere((el) => el.id == id);
      if (isExist == -1) {
        final checkedItem = detailsList!.requirement[requirementIndex];
        selecteditems.add(
          SelectedItem(
            count: 0,
            perUnit: checkedItem.unitPrice,
            id: id,
            checked: data!,
          ),
        );
      } else {
        selecteditems[isExist].checked = data!;
      }
      setTotalAmount();
    }
    notifyListeners();
  }

  void onChangeamount(int count, int index, String id) {
    final requirementIndex =
        detailsList!.requirement.indexWhere((element) => element.id == id);
    if (requirementIndex != -1) {
      final isExist = selecteditems.indexWhere((el) => el.id == id);
      if (isExist == -1) {
        final checkedItem = detailsList!.requirement[requirementIndex];
        selecteditems.add(
          SelectedItem(
            count: count,
            perUnit: checkedItem.unitPrice,
            id: id,
            checked: true,
          ),
        );
      } else {
        selecteditems[isExist].count = count;
      }
      setTotalAmount();
    }
    notifyListeners();
  }

  void setTotalAmount() {
    totalAmount = selecteditems.fold(
        0,
        (total, element) =>
            element.checked ? total + element.perUnit * element.count : total);
    notifyListeners();
  }

  List<SelectedItem> getActiveDonations() {
    final activeDonations = selecteditems
        .where((element) => element.checked && element.count > 0)
        .toList();

    log(activeDonations.toString());

    return activeDonations;
  }

  Future<void> addOrder({
    required BuildContext context,
    required String id,
    required AllDetailsModel detailsList,
    required List<TextEditingController> needsControllerList,
  }) async {
    isLoading = true;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 2));
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Order placed successfully')),
      // );
    } catch (error) {
      log('Error adding order: $error');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to place order')),
      );
    }

    isLoading = false;
    notifyListeners();
  }
}
