import 'package:flutter/material.dart';
import 'package:pdf_3d_viewer/files/splashScreen.dart';
import 'files/loginPage.dart';
import 'files/registerpage.dart'; // Bu satırı eklediğine emin ol

void main() {
  runApp(const MyApp()); // 👈 burada const eksikti, ekledim
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Key parametresi burada da önemli

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title: '3D Viewer Demo',
      home: const SplashScreen(), // Buraya yönlendiriyoruz
      debugShowCheckedModeBanner: false,
    );
  }
}