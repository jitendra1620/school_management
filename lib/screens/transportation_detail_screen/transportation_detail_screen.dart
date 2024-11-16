

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_management/models/student_data_model/student_data_model.dart';
import 'package:school_management/service/google_sheet_service.dart';

class TransportationDetailsScreen extends StatefulWidget {
  const TransportationDetailsScreen({super.key});

  @override
  State<TransportationDetailsScreen> createState() => _TransportationDetailsScreenState();
}

class _TransportationDetailsScreenState extends State<TransportationDetailsScreen> {
StudentDM? studentData;
@override
  void initState() {
    super.initState();
    getStudent();
  }

getStudent() async {
    studentData = await GoogleSheetService.getCurrentStudent();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transportation Details'), leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop(); // GoRouter's method to navigate back
          },
        )),
      body: Center(child: Text(studentData?.transportationDetails.split(",").join("\n") ?? 'No transportation details found', textAlign: TextAlign.center,)),
    );
  }
}