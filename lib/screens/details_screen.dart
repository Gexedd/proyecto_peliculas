import 'package:flutter/material.dart';
import 'package:proyecto_peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//TODO: Cambiar por una instancia de The movie

    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? "no-movie";
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(),
        //Añadiendo cosas para que se vean debajo
        //Deben ser del tipo sliver list
        SliverList(delegate: SliverChildListDelegate([
          _PosterAndTitle(),
          _Overview(),
          _Overview(),
          _Overview(),
          _Overview(),
          CastinCards(),

        ]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: Colors.indigo,
        expandedHeight: 200,
        floating: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          titlePadding: EdgeInsets.all(0),
          title: Container(
            padding: EdgeInsets.only(bottom: 10),
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              color: Colors
                  .black26, //Oscurece un poco la foto para que se vea mejor el texto de la pelicula
              child: Text(
                "movie.title",
                style: TextStyle(fontSize: 20),
              )),
          background: FadeInImage(
            placeholder: AssetImage("assets/loading.gif"),
            image: NetworkImage(
                "http://mireflex.sytes.net/cinemaplus2/posters/943c34f65a87fb246b5069ce4c11df46.jpg"),
            fit: BoxFit.fitWidth,
          ),
        ));
  }
}

class _PosterAndTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        //Creo Rows para tener elementos uno al lado del otro
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(
                  "http://mireflex.sytes.net/cinemaplus2/posters/943c34f65a87fb246b5069ce4c11df46.jpg"),
              height: 180,
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "movie-title",
                style: Theme.of(context).textTheme.headlineMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                "original-title",
                style: Theme.of(context).textTheme.headlineSmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Row(
                children: [
                  Icon(Icons.star, size: 15, color: Colors.amber),
                  SizedBox(width: 10),
                  Text(
                    "movie.voteAverage",
                    style: Theme.of(context).textTheme.bodySmall,
                  )
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
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Text('Graecis qualisque conubia mauris dictum falli cubilia simul accusata urbanitas. Posuere libero qualisque sententiae theophrastus. Cetero natoque salutatus purus tibique himenaeos libris ad vituperatoribus.',
      textAlign: TextAlign.justify,
      style:Theme.of(context).textTheme.bodyMedium),
    );
  }
}

