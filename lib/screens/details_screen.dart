import 'package:flutter/material.dart';
import 'package:proyecto_peliculas/models/movie.dart';
import 'package:proyecto_peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//TODO: Cambiar por una instancia de The movie

    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(movie),
        //Añadiendo cosas para que se vean debajo
        //Deben ser del tipo sliver list
        SliverList(delegate: SliverChildListDelegate([
          _PosterAndTitle(movie),
          _Overview(movie),
          CastinCards(movie.id),

        ]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {

  final Movie movie;
  const _CustomAppBar(this.movie);

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
            padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
              width: double.infinity,

              alignment: Alignment.bottomCenter,
              color: Colors
                  .black26, //Oscurece un poco la foto para que se vea mejor el texto de la pelicula
              child: Text(
                movie.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              )),
          background: FadeInImage(
            placeholder: AssetImage("assets/loading.gif"),
            image: NetworkImage(movie.fullBackdropPath),
            fit: BoxFit.fitWidth,
          ),
        ));
  }
}

class _PosterAndTitle extends StatelessWidget {

  final Movie movie;

  const _PosterAndTitle(this.movie);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        //Creo Rows para tener elementos uno al lado del otro
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                height: 180,
              ),
            ),
          ),

          SizedBox(width: 20),
          
          ConstrainedBox(
            constraints: BoxConstraints (maxWidth: size.width -200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                Text(
                  movie.originalTitle + '.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  children: [
                    Icon(Icons.star, size: 15, color: Colors.amber),
                    SizedBox(width: 10),
                    Text(
                      movie.voteAverage.toString(),
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final Movie movie;

  const _Overview(this.movie);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Text(movie.overview,
      textAlign: TextAlign.justify,
      style:Theme.of(context).textTheme.bodyMedium),
    );
  }
}

