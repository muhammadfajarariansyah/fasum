import 'package:fasum/screens/home_screen.dart';
import 'package:fasum/screens/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Pastikan binding Flutter sudah diinisialisasi
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Inisialisasi Firebase
  );
  runApp(const MainApp()); // Jalankan aplikasi
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fasum",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData){
            return const HomeScreen();
          }else{
            return const SignInScreen();
          }
        },
      ),
    );
  }
}
