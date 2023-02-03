import 'package:fl_tfilms/providers/movies_provider.dart';
import 'package:fl_tfilms/providers/popular_provider.dart';
import 'package:flutter/material.dart';
import 'package:fl_tfilms/screens/screens.dart';
import 'package:fl_tfilms/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MoviesProvider(), lazy: false),
        ChangeNotifierProvider(create: (context) => PopularProvider(), lazy: false),
      ],
      child: const MyApp(),
    );
  }
}

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
      theme: AppTheme.lightTheme,
    );
  }
}