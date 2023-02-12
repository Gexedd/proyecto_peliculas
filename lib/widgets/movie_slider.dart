import 'package:flutter/material.dart';
import 'package:proyecto_peliculas/models/models.dart';

class MovieSlider extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final Function onNextPage;

  const MovieSlider(
      {super.key, required this.movies, required this.onNextPage, this.title});

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {
        //TODO llamar el provider
        print('obtener siguiente pagina');
        widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 290,
      //color: Colors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (this.widget.title != null)
            //TODO si no hay titulo no se debe mostrar este widget
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                this.widget.title!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          Expanded(
            child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.movies.length,
                itemBuilder: (_, int index) =>  _MoviePoster(movie: widget.movies[index], heroId:'${widget.title}-$index-${widget.movies[index].id}')),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  //TODO: debe recbir final movie;

  final Movie movie;
  final String heroId;

  _MoviePoster({super.key, required this.movie, required this.heroId});

  @override
  Widget build(BuildContext context) {

    movie.heroId =heroId;

    return Container(
      width: 130,
      height: 190,
      //color: Colors.blue,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: movie),
            child: Hero(
              tag: heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(movie.fullPosterImg),
                  width: 130,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          SizedBox(height: 5), //Truco para separar un poco el titulo
          Column(
            children: [
              Text(movie.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 45),
                    child: Icon(Icons.star, size: 15, color: Colors.amber),
                  ),
                  Text(movie.voteAverage.toString(), textAlign: TextAlign.left),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
