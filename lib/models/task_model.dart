class Task{
  String? title;
  String? notes;
  // String? date;
  // String? startTime;
  // String? endTime;

  Task({this.title,this.notes});
  Map<String, dynamic> toJson(){
    return{
      'title': title,
      'notes': notes,
      // 'date': date,
      // "startTime":startTime,
      // "endTime":endTime,
    };
  }
  Task.fromJson(Map<String,dynamic> json){
    title = json['title'];
    notes = json['notes'];
    // date = json['date'];
    // startTime = json["startTime"];
    // endTime = json["endTime"];
  }
}