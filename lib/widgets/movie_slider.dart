import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350,
      color: Colors.red,
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
                return Container(
                  width: 130,
                  height: 190,
                  color: Colors.green,
                  margin: const EdgeInsets.all(10),
                );
              },
            ),
          )
        ]
      ),
    );
  }
}