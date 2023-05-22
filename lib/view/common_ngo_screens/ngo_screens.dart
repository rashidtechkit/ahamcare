import 'package:ahamcare/view/common_ngo_screens/common_listview_screen/listview_screen.dart';
import 'package:ahamcare/view/common_ngo_screens/common_map_screen/map_screen.dart';
import 'package:ahamcare/view/widgets/common_appbar_widget.dart';
import 'package:flutter/material.dart';

class CommonNgoScreen extends StatelessWidget {
  const CommonNgoScreen({
    super.key,
    required this.id,
    required this.title,
  });
  final String id;
  final String title;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: appBarWidget(
          context,
          title,
          const [
            Tab(
              text: "Map",
            ),
            Tab(
              text: "Listview",
            ),
          ],
          false,
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const MapScreen(),
            CommonListviewScreen(id: id),
          ],
        ),
      ),
    );
  }
}
