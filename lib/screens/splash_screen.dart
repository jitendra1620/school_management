import 'package:flutter/material.dart';
import 'package:school_management/routes/app_router.dart';
import 'package:school_management/service/google_sheet_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      GoogleSheetService.getCurrentStudent().then((value) {
        AppRouter.go(context, value == null ? AppRouter.login : AppRouter.home);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(color: Colors.white,),);
  }
}