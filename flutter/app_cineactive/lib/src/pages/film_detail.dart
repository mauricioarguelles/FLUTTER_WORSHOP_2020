import 'package:flutter/material.dart';

import 'package:films/src/models/film_model.dart';
import 'package:films/src/models/actors_model.dart';
import 'package:films/src/provider/film_provider.dart';

class FilmDetail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Film film = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            _createAppbar(film),
            SliverList(
              delegate: SliverChildListDelegate (
                [
                  SizedBox(
                    height: 10.0,
                  ),
                  _posterTitle(context, film),
                  _decription( film),
                  _decription( film),
                  _decription( film),
                  _decription( film),
                  _decription( film),
                  _createCasting(film)
                ]
              )
            )
          ],
        ),
    );
  }

  Widget _createAppbar(Film film) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigo,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          film.title,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/img/loading.gif'),
          image: NetworkImage(film.getBackgroundImg()),
          fit: BoxFit.cover,
          fadeInDuration: Duration(milliseconds: 15),
        ),
      ),
    );
  }

  _posterTitle(BuildContext context, Film film) {

    return Container(
      /* Escribe tu código aquí */
    );

  }

  Widget _decription(Film film) {

    return Container(
        /* Escribe tu codigo aqui */
    );

  }

  Widget _createCasting(Film film) {
    
      final filmProvider = new FilmProvider();

      return FutureBuilder(
        future: filmProvider.getCast(film.id.toString()),/* Escribe tu codigo aqui */
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          return Container();
        } /* Escribe tu codigo aqui */,
      );
  }

}