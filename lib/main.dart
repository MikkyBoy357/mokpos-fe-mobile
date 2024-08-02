import 'dart:io';


import 'package:flutter/material.dart';
import 'package:mokpos/app/view/onboarding_screens/onboarding_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  runApp( const App());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class App extends StatelessWidget {
  const App({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MokPos',
      home: const MyApp(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Color(0xFF2A3256),
            fontSize: 16,
          ),
        ),
      ),
      // darkTheme: _themeData(Brightness.dark),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingScreen();
  }

  // buildHome() {
  //   return Consumer<UserViewModel>(
  //     builder: (context, userViewModel, _) {
  //       return Builder(
  //         // stream: FirebaseAuth.instance.authStateChanges(),
  //         builder: (BuildContext context) {
  //           // print("Checking Snapshot data => ${snapshot}");
  //           if (FirebaseAuth.instance.currentUser != null) {
  //             print("User is not null");
  //             // print(snapshot);
  //             return FutureBuilder(
  //               future: userViewModel.getUser(),
  //               builder: (context, AsyncSnapshot dataSnapShot) {
  //                 if (dataSnapShot.connectionState == ConnectionState.waiting) {
  //                   return OnboardingScreen();
  //                 } else {
  //                   // return Builder(builder: (context) {
  //                   //   print(
  //                   //       "======UserType====> ${userViewModel.user?.userType}");
  //
  //                   if (userViewModel.user?.userType == "owner") {
  //                     // Constant.navigatePushReplacement(context, MainScreen());
  //                     return MainScreen();
  //                   } else {
  //                     // Constant.navigatePushReplacement(context, CashierMainScreen());
  //                     return CashierMainScreen();
  //                   }
  //                   // });
  //                 }
  //               },
  //             );
  //           } else {
  //             return OnboardingScreen();
  //           }
  //         },
  //       );
  //     },
  //   );
  // }
}
