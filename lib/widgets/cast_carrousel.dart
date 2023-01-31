import 'package:flutter/material.dart';

class CastCarrousel extends StatelessWidget {
  const CastCarrousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 180,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return _CastCard();
          },
        ),      
    );
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage('https://avatar.amuniversal.com/user_avatars/avatars_gocomicsver3/1241000/1241766/spongebob-300x400.jpg'),
              width: 110,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox( height: 5,),
          
          Text(
            'Actor.name Bob Esponja',
            //Acortar el texto a dos lineas
            maxLines: 2,
            //Poner puntos suspensivos
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),

    );
  }
}