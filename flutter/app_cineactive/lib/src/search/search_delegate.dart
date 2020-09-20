import 'package:flutter/material.dart';
import 'package:films/src/provider/film_provider.dart';
import 'package:films/src/models/film_model.dart';

class DataSearch extends SearchDelegate {

  final films = [
    'Spiderman',
    'Aquaman',
    'Batman',
    'Shazam!',
    'Ironman',
    'Capitan America',
    
  ];

  final filmsCurrents = [
    'Spiderman',
    'Capitan America'
  ];

  var selection = '';
  final filmsProvider = new FilmProvider();

  @override
  List<Widget> buildActions(BuildContext context) {
    // : Actions of our AppBar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = '';
        }
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // : Icon left to AppBar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation
        ),
        onPressed: (){
          close(context, null);
        }
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    // : Builder of results for to show
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(selection),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // : Suggestions that appear when the persons writes

    if (query.isEmpty) {
      return Container();
    } 
    
    return FutureBuilder(
      future: filmsProvider.searchFilm(query),
      builder: (BuildContext context, AsyncSnapshot<List<Film>> snapshot) {
        
          if (snapshot.hasData) {

            final films = snapshot.data;

            return ListView(
              children: films.map( (film) {
                return ListTile(
                    leading: FadeInImage(
                      placeholder: AssetImage('assets/img/no-image.jpg'),
                      image: NetworkImage(film.getPosterImg()),
                      fit: BoxFit.contain,
                      width: 50.0,
                    ),
                    title: Text(film.title),
                    subtitle: Text(film.originalTitle),
                    onTap: (){
                      close(context, null);
                      film.uniqueId = '';
                      Navigator.pushNamed(context, 'detail', arguments: film);
                    },
                );
              }).toList(),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

      },
    );
  }

  // @override
  // Widget buildSuggestions(BuildContext context) {
  //   // : Suggestions that appear when the persons writes

  //   final listSuggestions = ( query.isEmpty )
  //                  ? filmsCurrents 
  //                  : films.where(
  //                     (p) => p.toLowerCase().startsWith(query.toLowerCase())
  //                    ).toList();


  //   return ListView.builder(
  //     itemCount: listSuggestions.length,
  //     itemBuilder: (context, i){
  //       return ListTile(
  //         leading: Icon(Icons.movie),
  //         title: Text(listSuggestions[i]),
  //         onTap: (){
  //           selection = listSuggestions[i];
  //           showResults(context);

  //         },
  //       );
  //     }
  //   );
  // }
  
}