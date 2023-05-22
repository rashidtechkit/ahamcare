import 'dart:developer';

import 'package:ahamcare/model/home_model/get_all_details_model.dart';
import 'package:ahamcare/services/home_service/get_all_details.dart';
import 'package:flutter/material.dart';

class GetDetailsController extends ChangeNotifier {
  final TextEditingController needsController = TextEditingController();
  List<TextEditingController> needsControllerList = [];
  bool isLoading = false;
  int totalAmount = 0;
  bool isChecked = false;
  Map<int, bool> selectedFlag = {};
  bool isSelectionMode = false;
  List<bool> isCheckedList = [];
  AllDetailsModel? detailsList;

  Future<void> getAllDetails(BuildContext context, String id) async {
    isLoading = true;
    notifyListeners();
    await GetAllDetailsService().getAllDetailsService(context, id).then(
      (value) {
        if (value != null) {
          detailsList = value;
          isCheckedList = List<bool>.filled(detailsList!.requirement.length,
              false); // Initialize isCheckedList with the appropriate length
          notifyListeners();
        } else {
          // Handle error case
          detailsList = null;
          isCheckedList = [];
          notifyListeners();
        }
      },
    );
    isLoading = false;
    notifyListeners();
  }

  void onChange(bool? data, int index) {
    int count = 0;
    isCheckedList[index] = data ?? false;

    if (detailsList?.requirement != null) {
      for (var i = 0; i < detailsList!.requirement.length; i++) {
        if (isCheckedList[i] == true) {
          count += detailsList!.requirement[i].unitPrice;
        }
      }
    }

    // totalAmount = count;
    notifyListeners();
  }

  void onChangeamount(int count, int index) {
    int newCount = 0;

    // Ensure isCheckedList has a valid length
    if (isCheckedList.length > index) {
      isCheckedList[index] = count != 0;
    }

    if (detailsList?.requirement != null) {
      for (var i = 0; i < detailsList!.requirement.length; i++) {
        if (isCheckedList[i]) {
          newCount += detailsList!.requirement[i].unitPrice;
        }
      }
    }

    totalAmount = newCount;
    notifyListeners();
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
      await Future.delayed(Duration(seconds: 2));
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Order placed successfully')),
      // );
    } catch (error) {
      log('Error adding order: $error');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to place order')),
      );
    }

    isLoading = false;
    notifyListeners();
  }
}
