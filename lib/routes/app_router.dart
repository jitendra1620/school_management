import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_management/models/CircularDataModel/circular_data_model.dart';
import 'package:school_management/screens/circular_detail_screen/circular_detail_screen.dart';
import 'package:school_management/screens/home/home_screen.dart';
import 'package:school_management/screens/login_screen.dart';
import 'package:school_management/screens/profile_screen.dart';
import 'package:school_management/screens/splash_screen.dart';
import 'package:school_management/screens/transportation_detail_screen/transportation_detail_screen.dart';
import 'package:school_management/service/google_sheet_service.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Define main routes
  static const splash = '/';
  static const home = '/home';
  static const login = '/login';
  static const profile = '/profile';
  static const settings = '/settings';
  static const transportationDetails = '/transportation-details';
  static const circularDetails = '/circular-details';

  // You can use GoRoute to define the routes
  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: splash,  // Starting point of the app
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashScreen(),
      ),
      // Main route
      GoRoute(
        path: home,
        builder: (context, state) =>  const HomeScreen(),
      ),
      GoRoute(
        path: circularDetails,
        builder: (context, state) =>  CircularDetailsScreen(circularDetail: state.extra as CircularDataModel),
      ),
      
      // Login route
      GoRoute(
        path: login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: transportationDetails,
        builder: (context, state) => const TransportationDetailsScreen(),
      ),
      // Profile route
      GoRoute(
        path: profile,
        builder: (context, state) =>  const ProfileScreen(),
        // redirect: (context, state) {
        //   bool isLoggedIn = true;//checkIfLoggedIn();
        //   if (!isLoggedIn) {
        //     return '/login'; // Redirect to login if not logged in
        //   }
        //   return null;
        // },
      ),
      
      // Settings route
      // GoRoute(
      //   path: settings,
      //   builder: (context, state) => SettingsScreen(),
      // ),
      
      // // Nested routes for user management
      // GoRoute(
      //   path: '/user',
      //   builder: (context, state) => UserScreen(),
      //   routes: [
      //     // Child route of '/user'
      //     GoRoute(
      //       path: 'edit',
      //       builder: (context, state) => EditUserScreen(),
      //     ),
      //   ],
      // ),
    ],
    redirect: (context, state) {
      GoogleSheetService.getCurrentStudent().then((value) {
        if (value == null) {
          return AppRouter.login;
        }
      });
          return null;
    },
    errorBuilder: (context, state) {
      bool isLoggedIn = false;//checkIfLoggedIn();
      if (!isLoggedIn) {
        // If not logged in, redirect to login screen
        Future.delayed(Duration.zero, () {
          context.go(AppRouter.login);
        });
      }
      // Error route when an invalid path is provided
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Page not found!')),
      );
    },
  );

   /// Use push instead of go to add routes to the navigation stack.
  static void push(BuildContext context, String path, {dynamic extra}) {
    context.push(path, extra: extra);
  }

  /// Go to a route without adding it to the stack (replaces the current route).
  static void go(BuildContext context, String path, {dynamic extra}) {
    context.go(path, extra: extra);
  }
}
