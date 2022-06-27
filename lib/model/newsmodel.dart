

class NewsModel {
  List<News> data;
  int status;


  NewsModel({required this.data , required this.status});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
   // log("slsllsl:${json}");
    if (json['data'] != null) {
     // log("slsllsl:${json}");
      var tagObjsJson = json['data'] as List;


    List<News> _tags =
          tagObjsJson.map((tagJson) => News.fromJson(tagJson)).toList();
      //log("slsllddddsl:${_tags.length}");

        return NewsModel(data: _tags, status: json['code'] as int);


    }
    else {

      List<News> _tags=[];
      return NewsModel(data: _tags, status: json['status'] as int);
    }
  }
}

class News {
  int id;
  String title;
  String details;
  String image;
  String date_time;


  News(
      {required this.id,
      required this.title,
      required this.details,
      required this.image,
      required this.date_time});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        id: json['id'] as int,
        title: json['title'],
        details: json['details'],
        image: json['image'],
        date_time: json['date_time'],
       );
  }
}
