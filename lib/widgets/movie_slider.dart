import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 290,
      //color: Colors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Populares",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (_, int index) => _MoviePoster()),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
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
                image: NetworkImage("http://mireflex.sytes.net/cinemaplus2/posters/943c34f65a87fb246b5069ce4c11df46.jpg"),
                width: 130,
                height:180 ,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox( height: 5), //Truco para separar un poco el titulo
          Text("Titulo Película Esta es una descripcion larga", overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center),
          Text("Puntaje IMDB",
          textAlign: TextAlign.left)

        ],
      ),
    );
  }
}
