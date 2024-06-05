import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pertemuan12/pages/auth/login_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NotesApp Sahrudin',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 67, 144, 148)),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
