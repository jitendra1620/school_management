import 'package:flutter/material.dart';
import 'package:school_management/routes/app_router.dart';
import 'package:school_management/service/google_sheet_service.dart';
import 'package:school_management/utils/async_storage_manager.dart';
import 'package:school_management/widgets/snack_bar_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }
  void _handleLogin() {
    final phone = _phoneController.text;
    final password = _passwordController.text;
    final studentData = GoogleSheetService.studentDataList.where(
      (element) => element.phoneToLogin == phone,
    ).firstOrNull;
    if (studentData != null) {
      final bePassword = (studentData.firstName +
            (studentData.dateOfBirthDateTime.toString().split('-').firstOrNull ?? ''));
      AsyncStorageManager().save(AsyncStorageKeys.mobileNumberToLogin, phone);
      AppRouter.go(context, AppRouter.home);
      print(bePassword);
    } else {
      SnackBarManager().showSnackBar(
        context: context,
        message: "Please enter valid phone number or password",
        backgroundColor: Colors.blue,
        duration: const Duration(seconds: 2),
        // action: SnackBarAction(
        //   label: 'UNDO',
        //   onPressed: () {
        //     // Code to undo the action
        //   },
        // ),
      );
    }

    print('Phone: $phone');
    print('Password: $password');
  }

  Future<void> _callSupport() async {
    const phoneNumber = 'tel:+1234567890';
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  // Function to handle email contact
  Future<void> _emailSupport() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'support@example.com',
      queryParameters: {'subject': 'Support Request'},
    );
    if (await canLaunch(emailUri.toString())) {
      await launch(emailUri.toString());
    } else {
      throw 'Could not launch $emailUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
              // Image.asset(
              //   'assets/logo.png', // Ensure your logo is added to the assets folder and pubspec.yaml
              //   height: 100,
              // ),
              const SizedBox(height: 40),

              // Phone Number TextField
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  border: const OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone, color: Colors.blue[700]),
                ),
              ),
              const SizedBox(height: 20),

              // Password TextField
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock, color: Colors.blue[700]),
                  suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
                ),
              ),
              const SizedBox(height: 30),

              // Login Button
              ElevatedButton(
                onPressed: _handleLogin,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                ),
                child: const Text('Login'),
              ),
              const SizedBox(height: 40),

              // Contact Information Buttons
              const SizedBox(height: 40),

              // Contact Information Section
              Text(
                'Need Help?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[900],
                ),
              ),
              const SizedBox(height: 10),

              // Contact Phone Number
              GestureDetector(
                onTap: _callSupport,
                child: Text(
                  '📞 +1 234 567 890',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue[700],
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 5),

              // Contact Email
              GestureDetector(
                onTap: _emailSupport,
                child: Text(
                  '📧 support@schoolname.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue[700],
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
