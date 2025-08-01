// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class SplashView extends StatefulWidget {
//   static const String routeName = '/splash-view';
//   static Route route() {
//     return MaterialPageRoute(
//         builder: (context) => SplashView(),
//         settings: const RouteSettings(name: routeName));
//   }

//   FirebaseAuth firebaseAuth = FirebaseAuth.instance;

//   SplashView({super.key});

//   @override
//   State<SplashView> createState() => _SplashViewState();
// }

// class _SplashViewState extends State<SplashView> {
//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(const Duration(seconds: 4), () async {
//       final user = await FirebaseAuth.instance.authStateChanges().first;
//       Navigator.pushNamedAndRemoveUntil(
//           context,
//           // user != null ? AppShell.routeName : SignInView.routeName,
//           // (Route<dynamic> route) => false);
//     });

//     return Scaffold(
//         backgroundColor: Colors.black,
//         body: Center(
//           child: Image.asset(
//             'assets/images/splash/1splash.gif',
//           ),
//         ));
//   }
// }

// //===============================================================
// //==================== did not used this ========================
// // class CheckAuthStatus extends StatefulWidget {
// //   static const String routeName = '/check-auth-status';

// //   static Route route() {
// //     return MaterialPageRoute(
// //         builder: (context) => const CheckAuthStatus(),
// //         settings: const RouteSettings(name: routeName));
// //   }

// //   const CheckAuthStatus({super.key});

// //   @override
// //   State<CheckAuthStatus> createState() => _CheckAuthStatusState();
// // }

// // class _CheckAuthStatusState extends State<CheckAuthStatus> {
// //   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// //   bool isUserInAPP = false;
// //   Future<void> isUserPresent() async {
// //     await Future.delayed(const Duration(seconds: 1));
// //     if (firebaseAuth.currentUser != null) {
// //       isUserInAPP = true;
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return FutureBuilder(
// //       future: isUserPresent(),
// //       builder: (context, snapshot) {
// //         if (snapshot.connectionState == ConnectionState.waiting) {
// //           return const Loading();
// //         } else if (firebaseAuth.currentUser != null) {
// //           return const AppShell();
// //         } else {
// //           return SignInView();
// //         }
// //       },
// //     );
// //   }
// // }
