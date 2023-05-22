import 'package:ahamcare/model/home_model/get_all_oraganizations.dart';
import 'package:ahamcare/services/home_service/get_all_organizations_service.dart';
import 'package:ahamcare/view/common_ngo_screens/common_listview_screen/all_common_details_view/all_details_view.dart';
import 'package:flutter/material.dart';

class AllOrganizationController extends ChangeNotifier {
  bool isOrg = false;
  List<GetAllOrganizationsModel> organizations = [];

  Future<void> getAllOrganizations(context, String id) async {
    isOrg = true;
    notifyListeners();
    await GetAllOrganizationService().getOrganizationService(context, id).then(
      (value) {
        if (value != null) {
          organizations = value;
          notifyListeners();
          isOrg = false;
          notifyListeners();
        } else {
          isOrg = false;
          notifyListeners();
          return null;
        }
      },
    );
    isOrg = false;
    notifyListeners();
  }

  // void toAllDetailsPage(context, String titleName, String id, int index) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) {
  //         return const AllCommonDetailsViewScreen();
  //       },
  //     ),
  //   );
  //   notifyListeners();
  // }
}
