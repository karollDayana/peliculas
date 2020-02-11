class Cast {
  List<Actor> actores = new List();

  Cast.fromJsonList(List<dynamic> jsonList) {
    if(jsonList == null) return;

    jsonList.forEach((item) {
      final actor = Actor.fromJsonMap(item);
      actores.add(actor);
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
    this.profilePath,
    this.name,
    this.order,
  });
  
  Actor.fromJsonMap(Map<String, dynamic> json) {
    castId     = json['cast_id'];
    character  = json['character'];
    creditId   = json['credit_id'];
    gender     = json['gender'];
    id         = json['id'];
    profilePath= json['profile_path'];
    name       = json['name'];
    order      = json['order'];
  }

  getFoto() {
    if(profilePath == null) {
      return 'https://pngimage.net/wp-content/uploads/2018/06/imagen-no-disponible-png-4.png';
    }else {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }
  }
}