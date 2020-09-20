import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:films/src/models/film_model.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({@required this.films});

  final List<Film> films;



  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return Container(
        padding: EdgeInsets.only(top: 10.0),
        child: Swiper(
            itemWidth: _screenSize.width * 0.7,
            itemHeight: _screenSize.height * 0.5,
            layout: SwiperLayout.STACK,
            itemBuilder: (BuildContext context, int index) {

              films[index].uniqueId = '${ films[index].id}-cards';
              return Container(
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'detail', arguments: films[index]),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: FadeInImage(
                            placeholder: AssetImage('assets/img/no-image.jpg'),
                            image: NetworkImage(films[index].getPosterImg()),
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              );
            },
            autoplay: false,
            itemCount: films.length,
            // pagination: new SwiperPagination(),
            // control: new SwiperControl(),

          ),
      );
  }
}