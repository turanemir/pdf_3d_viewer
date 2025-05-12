import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pdf_3d_viewer/files/loginPage.dart'; // Bu import yolunu kontrol edin!

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter engine hazırlığı
  
  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyD7PYA6U3WNzC9xod0arKzXhWWvxG2RfWE",        // Firebase proje ayarlarınızdan alın
        appId: "1:841051632794:android:9210afc2b226413d4f1b23",           // Bunları eklemelisiniz
        messagingSenderId: "",
        projectId: "butceplanlama-d619c",
      ),
    );
    runApp(const MyApp());
  } catch (e) {
    print("Firebase başlatma hatası: $e");
    // Hata durumunda fallback bir UI gösterebilirsiniz
    runApp(MaterialApp(
      home: Scaffold(
        body: Center(child: Text("Firebase bağlantı hatası: $e")),
      ),
    ));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Debug banner'ı kapatır
      title: 'Gelir Gider App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(),
    );
  }
}