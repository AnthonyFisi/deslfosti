class Publication {
  int? id;
  String title;
  String description;
  int? stateGood;
  int? stateBad;

  Publication({this.id,required this.title,required this.description,this.stateGood,this.stateBad});

  Map<String,dynamic> toMap(){
    return {
      'id' : id,
      'title' : title,
      'description' : description,
      'stateGood' : stateGood,
      'stateBad' : stateBad,
    };
  }

  factory Publication.fromJson(Map<String,dynamic> json){
    return Publication(id: json['id'] ,title: json['title'], description: json['description'] , stateGood: json['stateGood'],stateBad: json['stateBad']);
  }
}