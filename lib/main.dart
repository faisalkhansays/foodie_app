
import 'package:flutter/material.dart';
import 'package:foodie/dashboard/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff8D8989)),
            fillColor:Color(0xffF5F7F9) ,
            outlineBorder: BorderSide(
              width: 0.5,
              color: Colors.grey,

            )

          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen());
  }
}
