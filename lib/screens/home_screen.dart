import 'package:fl_tfilms/providers/movies_provider.dart';
import 'package:fl_tfilms/providers/popular_provider.dart';
import 'package:fl_tfilms/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    //Instancia de las peliculas
    final moviesProvider = Provider.of<MoviesProvider>(context);

    //Instancia de las peliculas populares
    final popularMovies = Provider.of<PopularProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('T-Films'),
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(movies: moviesProvider.onDisplayMovies,),
            MovieSlider(popularMovies: popularMovies.onDisplayMovies),
          ],
        ),
      )
    );
  }
}