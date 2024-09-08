class TaskModel{
  String id;
  String userId;
  String title;
  String desc;
  int date;
  String time;
  bool isDone;

  TaskModel({this.id = "", this.userId = "", required this.title,required this.desc,required this.date,required this.time,required this.isDone});


  factory TaskModel.fromJson(Map<String , dynamic> json){
    return TaskModel(
        id: json["id"],
        userId: json["userId"],
        title: json["title"],
        desc: json["desc"],
        date: json["date"],
        time: json["time"],
        isDone: json["isDone"]);
  }


  Map<String,dynamic> toJson(){
    return{
      "id" : id,
      "userId" : userId,
      "title" : title,
      "desc" : desc,
      "date" : date,
      "time" : time,
      "isDone" : isDone
    };



  }


}
