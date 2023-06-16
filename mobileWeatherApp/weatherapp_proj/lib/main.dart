import 'package:flutter/material.dart';
import 'package:weatherapp_proj/screens/main_screen.dart';
import './utils/storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(title: 'Weather'),
    );
  }
}
