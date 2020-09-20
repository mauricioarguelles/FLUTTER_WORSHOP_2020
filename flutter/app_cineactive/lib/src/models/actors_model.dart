
class Cast {
  
  List<Actor> actors = new List();

  Cast();

  Cast.fromJsonList(List<dynamic> jsonList) {

    if (jsonList == null) return;

    jsonList.forEach( (item){
        final actor = new Actor.fromJsonMap(item);
        actors.add( actor );
    });

  }

}


class Actor {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  Actor.fromJsonMap(Map<String, dynamic> json) {
    castId        = json['cast_id'];
    character     = json['character'];
    creditId      = json['credi_id,'];
    gender        = json['gender'];
    id            = json['id'];
    name          = json['name'];
    order         = json['order'];
    profilePath   = json['profile_path'];
  }

  getPhoto() {

    if ( profilePath == null) {
      return 'https://www.searchpng.com/wp-content/uploads/2019/02/Men-Profile-Image-715x657.png';
    }

    return 'https://image.tmdb.org/t/p/original/$profilePath';
  }

}