// Sample Screens
import 'package:flutter/material.dart';
import 'package:school_management/models/student_data_model/student_data_model.dart';
import 'package:school_management/utils/async_storage_manager.dart';
import '../service/google_sheet_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  StudentDM? studentData;
  @override
  void initState() {
    super.initState();
   getStudent();
    
  }

  getStudent() async {
    final phoneToLogin =
        await AsyncStorageManager().get<String>(AsyncStorageKeys.mobileNumberToLogin);
    studentData = GoogleSheetService.studentDataList.where(
      (element) => element.phoneToLogin == phoneToLogin,
    ).firstOrNull;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture
              CircleAvatar(
                backgroundImage: NetworkImage(studentData?.photoUrl ?? ''),
                radius: 50,
              ),
              const SizedBox(height: 20),
              // Name
              Text(
                '${studentData?.firstName ?? ''} ${studentData?.lastName ??''}',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // Class and Enrollment Info
              Text(
                'Class: ${studentData?.className}',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Enrolled on: ${studentData?.dateOfBirthDateTime.toString().toString().split(' ')[0]}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              // Contact Info
              Text(
                'Phone: ${studentData?.phoneNumber}',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Email: ${studentData?.email}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              // Guardian Contact
              Text(
                'Guardian Contact: ${studentData?.guardianContact}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              // Address
              Text(
                'Address: ${studentData?.address}',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
