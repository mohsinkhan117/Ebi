import 'package:ebi/core/theme/themes.dart';
 import 'package:ebi/ui/catagories/catagories_view_model.dart';
import 'package:ebi/ui/views/auth/signin_view/signin_view.dart';
import 'package:ebi/ui/views/auth/signin_view/signin_view_model.dart';
import 'package:ebi/ui/views/auth/signup_view/signup_view_model.dart';
 import 'package:ebi/ui/views/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SigninViewModel()),
        ChangeNotifierProvider(create: (_) => SignupViewModel()),
        ChangeNotifierProvider(create: (_) => CatagoriesViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInView(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
