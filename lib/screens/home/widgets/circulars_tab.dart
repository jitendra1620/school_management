import 'package:flutter/material.dart';
import 'package:school_management/models/CircularDataModel/circular_data_model.dart';
import 'package:school_management/routes/app_router.dart';
import 'package:school_management/screens/home/home_screen.dart';
import 'package:school_management/service/google_sheet_service.dart';

class CircularsTab extends StatefulWidget {
  const CircularsTab({super.key});

  @override
  State<CircularsTab> createState() => _CircularsTabState();
}

class _CircularsTabState extends State<CircularsTab> {
  List<CircularDataModel> circularDataList = [];
  @override
  void initState() {
    super.initState();
    getCircularData();
  }
  getCircularData() async {
    circularDataList = await GoogleSheetService().fetchCircularData();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        padding: const EdgeInsets.all(16.0),
          itemCount: circularDataList.length,
          itemBuilder: (context, index) {
            final item = circularDataList[index];
            return SectionCard(
                title: item.title, content: item.description, onTap: () {
                  AppRouter.push(context, AppRouter.circularDetails, extra: item);
                });
          }),
    );
  }
}