import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class  CardSwiper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height *0.5,
      color: Colors.red,
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage("http://mireflex.sytes.net/cinemaplus2/posters/943c34f65a87fb246b5069ce4c11df46.jpg")
            ),
          );
        },
        itemCount: 5,
        pagination: SwiperPagination(),
        control: SwiperControl(),
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.65,
        itemHeight: size.height * 0.45,
      ),

    );
  }
}
