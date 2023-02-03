import 'package:card_swiper/card_swiper.dart';
import 'package:fl_tfilms/models/models.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key, required this.movies});
  // instancia de movies
  final List<Result> movies;
  @override
  Widget build(BuildContext context) {

    
    final size = MediaQuery.of(context).size;

    return Container(   
      width: double.infinity,
      height: size.height * 0.5,
      padding: const EdgeInsets.all(30),
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.9,
        itemBuilder: (context, index) {
          
          //Captura la pelicula con la posicion del indice
          final movie = movies[index];

          //Widgets que captura gestos por ejemplo ontap
          return GestureDetector(
            onTap: () => Navigator.popAndPushNamed(
              context, 'details', 
              arguments: movie
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage(movie.fullPosterImg),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}