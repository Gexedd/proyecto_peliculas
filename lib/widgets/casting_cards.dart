import 'package:flutter/material.dart';

class CastinCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 200,
      //color: Colors.red,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return _CastCard();
        },
      ),
    );
  }
}

class _CastCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 200,
      //color: Colors.green,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage("http://mireflex.sytes.net/cinemaplus2/posters/943c34f65a87fb246b5069ce4c11df46.jpg"),
            fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5),
          Text("nombre del actor You will find only what you bring in.",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
