import 'package:ahamcare/view/common_ngo_screens/common_listview_screen/all_common_details_view/attendance_tab_screen/attendance_tab_screen.dart';
import 'package:ahamcare/view/common_ngo_screens/common_listview_screen/all_common_details_view/details_tab_screen/details_tab_screen.dart';
import 'package:ahamcare/view/common_ngo_screens/common_listview_screen/all_common_details_view/requirements_tab_screen/requirements_tab_screen.dart';
import 'package:ahamcare/view/widgets/common_appbar_widget.dart';
import 'package:flutter/material.dart';

class AllCommonDetailsViewScreen extends StatelessWidget {
  const AllCommonDetailsViewScreen({
    super.key,
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: appBarWidget(
          context,
          name,
          [
            const Tab(
              text: "Details",
            ),
            const Tab(
              text: "Attendance",
            ),
            const Tab(
              text: "Requirements",
            )
          ],
          true,
        ),
        body: TabBarView(
          clipBehavior: Clip.antiAlias,
          viewportFraction: 1.05,
          physics: const ScrollPhysics(),
          children: [
            DetailsTabScreen(
              id: id,
            ),
            AttendanceTabScreen(
              id: id,
            ),
            RequirementsTabScreen(
              id: id,
            ),
          ],
        ),
      ),
    );
  }
}
