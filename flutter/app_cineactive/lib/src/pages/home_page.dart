import 'package:flutter/material.dart';

import 'package:films/src/search/search_delegate.dart';
import 'package:films/src/widgets/card_swiper_widget.dart';
import 'package:films/src/provider/film_provider.dart';
import 'package:films/src/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {
  final filmsprovider = new FilmProvider();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        centerTitle: false,
        title: Text('Films o movies'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            }
          )
        ],
      ),

      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperCards(),
          ],
        )
      ),

    );
  }

  Widget _swiperCards() {

      return FutureBuilder(
        future: filmsprovider.getInMovies(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {

          if (snapshot.hasData) {
            return CardSwiper(
              films: snapshot.data,
            );
          } else {
            return Container(
              height: 400,
              child: Center(
                child: CircularProgressIndicator()
              )
            );
          }
        },
      );
  }
}