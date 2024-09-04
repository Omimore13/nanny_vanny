import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nanny_vanny/services/init.dart';
import 'package:nanny_vanny/view/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Init().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nanny Vanny',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}