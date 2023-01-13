import 'package:fl_tfilms/screens/details_screen.dart';
import 'package:fl_tfilms/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'T-Films',
      initialRoute: 'home',
      routes: {
        //La barra baja omite la omision del context, no pasa nada
        'home':(_) => HomeScreen(),
        'details':(context) => DetailsScreen(),
      },
    );
  }
}