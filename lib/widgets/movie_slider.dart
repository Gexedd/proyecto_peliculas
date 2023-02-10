import 'package:flutter/material.dart';
import 'package:proyecto_peliculas/models/models.dart';


class MovieSlider extends StatelessWidget {
final List<Movie> movies;
final String? title;


  const MovieSlider({
    super.key,
    required this.movies,
    this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 290,
      //color: Colors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          if (this.title!= null)
          //TODO si no hay titulo no se debe mostrar este widget
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              this.title!,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (_, int index) => _MoviePoster(movie: movies [index])
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {

  //TODO: debe recbir final movie;
  final Movie movie;

  _MoviePoster({super.key, required this.movie});



  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      //color: Colors.blue,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          
          GestureDetector(
            onTap: ()=> Navigator.pushNamed(context, 'details', arguments: "movie-instance"),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                width: 130,
                height:180 ,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox( height: 5), //Truco para separar un poco el titulo
          Text(movie.title, overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center),
          Text("Puntaje IMDB",
          textAlign: TextAlign.left)

        ],
      ),
    );
  }
}
