
class DummyGenres {
  int? id;
  String? name;
  String? imageUrl;

  DummyGenres({this.id, this.name, this.imageUrl});

  DummyGenres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['ImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['ImageUrl'] = this.imageUrl;
    return data;
  }

  static List<DummyGenres> getDummyGeres(){
    List rawList =
    [
      {
        "id": 35,
        "name": "Comedies",
        "ImageUrl" : "assets/images/comedies.jpg"
      },
      {
        "id": 80,
        "name": "Crime",
        "ImageUrl" : "assets/images/crimes.jpg"
      },
      {
        "id": 10751,
        "name": "Family",
        "ImageUrl" : "assets/images/family.jpg"
      },

      {
        "id": 99,
        "name": "Documentaries",
        "ImageUrl" : "assets/images/documentries.jpg"
      },
      {
        "id": 18,
        "name": "Darama",
        "ImageUrl" : "assets/images/dramas.jpg"
      },
      {
        "id": 14,
        "name": "Fantasy",
        "ImageUrl" : "assets/images/fantasy.jpg"
      },


      {
        "id": 27,
        "name": "Horror",
        "ImageUrl" : "assets/images/horror.jpg"
      },

      {
        "id": 878,
        "name": "Sci-Fi",
        "ImageUrl" : "assets/images/sci_fi.jpg"
      },
      {
        "id": 53,
        "name": "Thriller",
        "ImageUrl" : "assets/images/thriller.jpg"
      }];
   return  rawList.map((e) => DummyGenres.fromJson(e)).toList();

  }
}




