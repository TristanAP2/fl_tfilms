import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: const Text('Favourites', style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              
            ),),
          ),
          //IMPORTANTE
          //Para que no de fallo de out of bounds con una altura fija lo envolvemos en expanded
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (context, index) {
                return _MoviePoster();
              },
            ),
          )
        ]
      ),
    );
  }
}

// Barra baja para indicar que es una clase PRIVADA
class _MoviePoster extends StatelessWidget {
  const _MoviePoster({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          //Poster
          GestureDetector(
            onTap: () => Navigator.popAndPushNamed(
              context, 'details', 
              arguments: 'movie-instance'
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage('https://avatar.amuniversal.com/user_avatars/avatars_gocomicsver3/1241000/1241766/spongebob-300x400.jpg'),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox( height: 10,),
          //Titulo
          Text(
            'El Señor de los Anillos: El Retorno del Rey',
            //Acortar el texto a dos lineas
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            
          )

        ],
      ),
    );
  }
}