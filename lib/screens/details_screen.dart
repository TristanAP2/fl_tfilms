import 'package:flutter/material.dart';
import 'package:fl_tfilms/widgets/widgets.dart';

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
    return SliverAppBar(
      expandedHeight: 200,
      
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
          child: Text('movie.title', style: TextStyle(fontSize: 16),),
        ),
        background: FadeInImage(
                placeholder: AssetImage('assets/loading.gif'), 
                image: NetworkImage('https://avatar.amuniversal.com/user_avatars/avatars_gocomicsver3/1241000/1241766/spongebob-300x400.jpg'),
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
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage('https://avatar.amuniversal.com/user_avatars/avatars_gocomicsver3/1241000/1241766/spongebob-300x400.jpg'),
              width: 125,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Titulo',
                style: Theme.of(context).textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text('Subtitulo',
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
      ),
    );
  }
}
class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text('Et commodo non non consectetur consectetur Lorem eu proident ullamco exercitation sit consequat. Veniam ut duis cillum esse. Voluptate consectetur deserunt excepteur deserunt tempor non ipsum. Pariatur sint aliquip consequat ut velit pariatur.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}