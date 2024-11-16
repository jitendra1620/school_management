

import 'package:flutter/material.dart';
import 'package:school_management/models/student_data_model/student_data_model.dart';
import 'package:school_management/routes/app_router.dart';
import 'package:school_management/screens/profile_screen.dart';
import 'package:school_management/screens/home/widgets/circulars_tab.dart';
import 'package:school_management/screens/home/widgets/home_tab.dart';
import 'package:school_management/service/google_sheet_service.dart';
import 'package:school_management/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
StudentDM? studentData;
@override
  void initState() {
    super.initState();
    getStudent();
  }
  // Navigation for bottom navigation
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
getStudent() async {
    studentData = await GoogleSheetService.getCurrentStudent();
    setState(() {});
  }

final List<Widget> _screens = [
    const HomeTab(),
    const CircularsTab(),
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          Builder(
            builder: (context) => IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Navigate to NotificationScreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationScreen()),
              );
            },
          ),
          ),
        ],
      ),
      body: Container(decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.6,
            image: NetworkImage('https://give.do/static/img/logos/10DO/d4f8fc87-55a0-43dc-8d7c-e9f52f21f3fa.jpg'),
            fit: BoxFit.scaleDown,
          ),
        ), child: _screens[_selectedIndex]),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Circulars',
          ),
        ],
      ),

      // Drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Drawer Header
             UserAccountsDrawerHeader(
              decoration: BoxDecoration(
        color: theme.indigo03,
    ),
              accountName: Text(studentData?.firstName ?? ''),
              accountEmail: Text(studentData?.email ?? ''),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(studentData?.photoUrl ?? ''),
                radius: 50,
              ),
            ),
            // List of menu options in the Drawer
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Notifications'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NotificationScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Exam Marks'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ExamMarksScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Diary Notes'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DiaryNotesScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('School Feed & Gallery'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SchoolFeedGalleryScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Transportation Details'),
              onTap: () {
                AppRouter.push(context, AppRouter.transportationDetails);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onTap;

  const SectionCard({super.key, 
    required this.title,
    required this.content,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title),
        subtitle: Text(content),
        trailing: const Icon(Icons.arrow_forward),
        onTap: onTap,
      ),
    );
  }
}


class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: const Center(child: Text('Notification List')),
    );
  }
}

class FeeDepositScreen extends StatelessWidget {
  const FeeDepositScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fee Deposit')),
      body: const Center(child: Text('Fee Deposit Status')),
    );
  }
}

class DiaryNotesScreen extends StatelessWidget {
  const DiaryNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Diary Notes')),
      body: const Center(child: Text('Diary Notes Content')),
    );
  }
}

class ExamMarksScreen extends StatelessWidget {
  const ExamMarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exam Marks')),
      body: const Center(child: Text('Exam Marks Content')),
    );
  }
}

class SchoolFeedGalleryScreen extends StatelessWidget {
  const SchoolFeedGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('School Feed & Gallery')),
      body: const Center(child: Text('School Feed & Gallery Content')),
    );
  }
}


