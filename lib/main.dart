import 'package:flutter/material.dart';
import 'package:helwan_store/helwan_store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Helwan Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HelwanStore(),
      debugShowCheckedModeBanner: false,
    );
  }
}




