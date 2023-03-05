import 'package:flutter/material.dart';
import 'package:screen_test/screens/ScreenCategories.dart';
import 'package:screen_test/screens/screenDetail.dart';
import 'package:screen_test/screens/screenGNB.dart';
import 'package:screen_test/screens/screenRecipe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        canvasColor: Color.fromARGB(255, 249, 255, 255),
        colorScheme: ThemeData.light().colorScheme.copyWith(
              secondary: const Color.fromARGB(255, 241, 234, 94),
            ),
        fontFamily: "Comfortaa",
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                color: Colors.white,
                fontFamily: "Jungledise",
                fontSize: 24,
              ),
              bodyMedium: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 16,
              ),
              bodyLarge: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // entry point
      home: ScreenGNB(),
      routes: {
        "/categories": (context) => ScreenCategories(),
        "/detail": (context) => ScreenDetail(),
        "/recipe": (context) => ScreenRecipe(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => ScreenCategories(),
        );
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => ScreenCategories(),
        );
      },
    );
  }
}
