import 'package:flutter/material.dart';
import 'package:vp18_maps/screens/app/map_screen.dart';
import 'package:vp18_maps/screens/core/launch_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          elevation: 0,
          color: Colors.white,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      initialRoute: "/launch_screen",
      routes: {
        "/launch_screen": (context) => const LaunchScreen(),
        "/map_screen": (context) => const MapScreen(),
      },
    );
  }
}
