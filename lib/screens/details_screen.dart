import 'package:flutter/material.dart';
import 'package:fl_tfilms/widgets/widgets.dart';
import 'package:fl_tfilms/models/models.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // Un tipo de appbar
      body: CustomScrollView(
        //Para que funcoine el widget tenemos que ponerle el sliver (como un childen pero solo admiten widgets especiales)
        slivers: [
          _CustomAppBar(),
          SliverList(delegate: SliverChildListDelegate([
              _InfoPelicula(),
              _Overview(),
              CastCarrousel()
            ])
          ),
        ],
      )
    );
  }
}


class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key});


  @override
  Widget build(BuildContext context) {
    //Recibimos por los argumentos un objeto result
    final Result movie = ModalRoute.of(context)!.settings.arguments as Result;

    return SliverAppBar(
      expandedHeight: 200,
      automaticallyImplyLeading: true,
      //Comportamiento al hacer scroll
      floating: true,
      pinned: true,
      snap: true,

      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black38,
          child: Text(movie.title, style: TextStyle(fontSize: 16),),
        ),
        background: FadeInImage(
                placeholder: AssetImage('assets/loading.gif'), 
                image: NetworkImage(movie.fullPosterImg),
                fit: BoxFit.cover,
              ),
      ),

    );
  }
}

class _InfoPelicula extends StatelessWidget {
  const _InfoPelicula({super.key});
  @override
  Widget build(BuildContext context) {
    //Recibimos por los argumentos un objeto result
    final Result movie = ModalRoute.of(context)!.settings.arguments as Result;
    return Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(movie.fullPosterImg),
                  height: 180,
                  width: 120,
                  fit: BoxFit.cover,
                  ),
                ),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: Theme.of(context).textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(movie.releaseDate.year.toString(),
                style: Theme.of(context).textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  Icon(Icons.star, size: 25, color: Colors.amber[400],),
                  SizedBox(width: 5,),
                  Text('3.7'),
                ],
              )
            ],
          )
          
        ],
      );
  }
}
class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {

    final Result movie = ModalRoute.of(context)!.settings.arguments as Result;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(movie.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}