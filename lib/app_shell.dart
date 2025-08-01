// lib/app_shell.dart

import 'package:ebi/app_shell_view_model.dart';
import 'package:ebi/core/theme/app_colors.dart';
import 'package:ebi/ui/views/catagories/catagories_view.dart';
import 'package:ebi/ui/views/checkout/checkout_view.dart';
import 'package:ebi/ui/views/home/home_view.dart';
import 'package:ebi/ui/views/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppShell extends StatelessWidget {
  static const String routeName = '/app-shell';
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (_) => AppShellViewModel(),
        child: const AppShell(),
      ),
      settings: const RouteSettings(name: routeName),
    );
  }

  final int initialIndex = 0;

  const AppShell({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final model = AppShellViewModel();
        model.setInitialIndex(initialIndex);
        return model;
      },
      child: Consumer<AppShellViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            body: PageView(
              controller: model.pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: model.onPageChanged,
              children: [
                HomeView(),
                CatagoriesView(),
                CheckoutView(),
                ProfileView(),
              ],
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).navigationBarTheme.backgroundColor,
                // boxShadow: [
                //   // BoxShadow(
                //   //     // color: const Color.fromARGB(221, 49, 48, 48),
                //   //     // offset: const Offset(0, -2),
                //   //     // blurRadius: 2,
                //   //     ),
                // ],
              ),
              child: BottomNavigationBar(
                currentIndex: model.currentIndex,
                onTap: model.onNavItemTapped,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: AppColors.primary,
                // unselectedItemColor: AppColors.textSecondary,
                backgroundColor: Colors.transparent,
                elevation: 0,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_rounded),
                    label: '',
                  ),
                  BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart_outlined),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.notifications_none_rounded),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline_rounded),
                    label: '',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
