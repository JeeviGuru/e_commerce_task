import 'package:e_commerce_app/get_it.dart';
import 'package:e_commerce_app/ui/splash_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  await registerDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getIt.allReady(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'E-Commerece App',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: false,
                pageTransitionsTheme: const  PageTransitionsTheme(
                  builders: {
                    TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
                    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                  },
                ),
              ),
              home: const SplashScreen(),
            );
          } else {
            return Container(
              color: Colors.purple,
            );
          }
        });
  }
}
