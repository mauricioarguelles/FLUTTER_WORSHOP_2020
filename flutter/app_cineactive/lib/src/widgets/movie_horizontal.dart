import 'package:flutter/material.dart';
import 'package:films/src/models/film_model.dart';

class MovieHorizontal extends StatelessWidget {
  
  final List<Film> films;
  final Function nextPage;

  final _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.3
  );

  MovieHorizontal({@required this.films, @required this.nextPage});

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener( () {

        if (_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200) {
          nextPage();
        }

    });

    return Container(
      height: _screenSize.height * 0.24,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        itemCount: films.length,
        itemBuilder: (context, i) => _card(context, films[i]),
        // children: _cards(context),
      ),
    );
  }

  Widget _card(BuildContext context, Film film){

    film.uniqueId = '${ film.id}-poster';

    final card = Container(
            margin: EdgeInsets.only(right: 15.0),
            child: Column(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Hero(
                    tag: film.uniqueId,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: FadeInImage(
                          placeholder: AssetImage('assets/img/no-image.jpg'),
                          image: NetworkImage(film.getPosterImg()),
                          fit: BoxFit.cover,
                          height: 160.0,
                      ),
                    ),
                  ),
                ), 
                SizedBox(height: 5.0),
                Text(
                  film.title,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
        );

    return GestureDetector(
        child: card,
        onTap: (){

          Navigator.pushNamed(context, 'detail', arguments: film);

          print('${film.title}');
        },
    );
  }

  List<Widget> _cards(BuildContext context) {

    return films.map( (film) {
        return Container(
            margin: EdgeInsets.only(right: 15.0),
            child: Column(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: FadeInImage(
                        placeholder: AssetImage('assets/img/no-image.jpg'),
                        image: NetworkImage(film.getPosterImg()),
                        fit: BoxFit.cover,
                        height: 160.0,
                    ),
                  ),
                ), 
                SizedBox(height: 5.0),
                Text(
                  film.title,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
        );
    }).toList();


  }
}