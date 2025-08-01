// lib/core/routes/routes_generator.dart

import 'package:ebi/ui/views/auth/signin_view/signin_view.dart';
import 'package:ebi/ui/views/auth/signup_view/signup_view.dart';
import 'package:ebi/ui/views/catagories/catagories_view.dart';
import 'package:flutter/material.dart';

class RouterGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    print("The Route is: ${settings.name}");
    switch (settings.name) {
      // case SplashView.routeName:
      //   return SplashView.route();

      case SignupView.routeName:
        return SignupView.route();

      case SignInView.routeName:
        return SignInView.route();
      case CatagoriesView.routeName:
        return CatagoriesView.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        backgroundColor: const Color(0xFFF5F5F5), // Light gray background
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Error Icon
              Icon(
                Icons.error_outline_rounded,
                size: 100,
                color: Colors.red.shade300,
              ),
              const SizedBox(height: 24),
              // Error Title
              const Text(
                'Oops!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3142),
                ),
              ),
              const SizedBox(height: 16),
              // Error Message
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  "The page you're looking for doesn't exist or is currently under construction.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF636773),
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // ================== Back Button ==================
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2D3142),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Go Back',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
      settings: const RouteSettings(name: '/error'),
    );
  }
}
