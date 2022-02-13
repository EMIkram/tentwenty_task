
class Genre {
  int? id;
  String? name;
  String? imageUrl;

  Genre({this.id, this.name, this.imageUrl});

  Genre.fromJson(Map<String, dynamic> json) {
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

  static List<Genre> getDummyGeres(){
    List rawList =
    [
      {
        "id": 35,
        "name": "Comedies",
        "ImageUrl" : ""
      },
      {
        "id": 80,
        "name": "Crime",
        "ImageUrl" : ""
      },
      {
        "id": 10751,
        "name": "Family",
        "ImageUrl" : ""
      },

      {
        "id": 99,
        "name": "Documentaries",
        "ImageUrl" : ""
      },
      {
        "id": 18,
        "name": "Darama",
        "ImageUrl" : ""
      },
      {
        "id": 14,
        "name": "Fantasy",
        "ImageUrl" : ""
      },


      {
        "id": 27,
        "name": "Horror",
        "ImageUrl" : ""
      },

      {
        "id": 878,
        "name": "Sci-Fi",
        "ImageUrl" : ""
      },
      {
        "id": 53,
        "name": "Thriller",
        "ImageUrl" : ""
      }];
   return  rawList.map((e) => Genre.fromJson(e)).toList();

  }
}




