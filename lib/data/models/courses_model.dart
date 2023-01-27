class CoursesModel {
  List<CoursesItem>? data;
  dynamic status;

  CoursesModel({this.data, this.status});

  CoursesModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => CoursesItem.fromJson(e)).toList();
    status = json["status"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.data != null) {
      data["data"] = this.data?.map((e) => e.toJson()).toList();
    }
    data["status"] = status;
    return data;
  }
}

class CoursesItem {
  int? id;
  bool? rated;
  String? title;
  String? desc;
  dynamic price;
  dynamic progress;
  String? type;
  String? image;
  String? previewVideo;
  String? courseTable;
  String? courseBag;
  String? peroid;
  int? averageRate;
  int? ratingCount;
  int? subscribers;
  dynamic subscribed;
  String? category;
  List<String>? teachers;
  List<Comments>? comments;
  List<Questions>? questions;
  List<Results>? results;

  CoursesItem(
      {this.id,
      this.title,
      this.rated,
      this.progress,
      this.desc,
      this.price,
      this.type,
      this.image,
      this.previewVideo,
      this.courseTable,
      this.courseBag,
      this.peroid,
      this.averageRate,
      this.ratingCount,
      this.subscribers,
      this.subscribed,
      this.category,
      this.teachers,
      this.comments,
      this.questions,
      this.results});

  CoursesItem.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    rated=json['rated'];
    progress=json['progress'];
    title = json["title"];
    desc = json["desc"];
    price = json["price"];
    type = json["type"];
    image = json["image"];
    previewVideo = json["preview_video"];
    courseTable = json["course_table"];
    courseBag = json["course_bag"];
    peroid = json["peroid"];
    averageRate = json["averageRate"];
    ratingCount = json["ratingCount"];
    subscribers = json["subscribers"];
    subscribed = json["subscribed"];
    category = json["category"];
    teachers =
        json["teachers"] == null ? null : List<String>.from(json["teachers"]);
    comments = json["comments"] == null
        ? null
        : (json["comments"] as List).map((e) => Comments.fromJson(e)).toList();
    questions = json["questions"] == null
        ? null
        : (json["questions"] as List)
            .map((e) => Questions.fromJson(e))
            .toList();
    results = json["results"] == null
        ? null
        : (json["results"] as List).map((e) => Results.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["id"] =    id;
    data['rated']=rated;
    data['progress']=progress;
    data["title"] = title;
    data["desc"] =  desc;
    data["price"] = price;
    data["type"] =  type;
    data["image"] = image;
    data["preview_video"] = previewVideo;
    data["course_table"] = courseTable;
    data["course_bag"] = courseBag;
    data["peroid"] =     peroid;
    data["averageRate"] =averageRate;
    data["ratingCount"] =ratingCount;
    data["subscribers"] =subscribers;
    data["subscribed"] = subscribed;
    data["category"] =   category;
    if (teachers != null){ data["teachers"] = teachers;}
    if (comments != null){
      data["comments"] = comments?.map((e) => e.toJson()).toList();}
    if (questions != null){
      data["questions"] = questions?.map((e) => e.toJson()).toList();}
    if (results != null){
      data["results"] = results?.map((e) => e.toJson()).toList();}
    return data;
  }
}

class Results {
  String? studentName;
  String? image;

  Results({this.studentName, this.image});

  Results.fromJson(Map<String, dynamic> json) {
    studentName = json["student_name"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["student_name"] = studentName;
    data["image"] = image;
    return data;
  }
}

class Questions {
  String? question;
  String? answer;

  Questions({this.question, this.answer});

  Questions.fromJson(Map<String, dynamic> json) {
    question = json["question"];
    answer = json["answer"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["question"] = question;
    data["answer"] =   answer;
    return data;
  }
}

class Comments {
  String? comment;
  String? user;
  String? course;
  String? rating;
  int? id;
  bool? me;

  Comments({this.comment,this.id,this.me, this.user, this.course,this.rating});

  Comments.fromJson(Map<String, dynamic> json) {
    comment = json["comment"];
    user = json["user"];
    id=json['id'];
    me=json['me'];
    rating=json['rating'];
    course = json["course"];
  }

  Map<String, dynamic> toJson() {
    final  data = <String, dynamic>{};
    data["comment"] = comment;
    data['rating']=rating;
    data['id']=id;
    data['me']=me;
    data["user"] =    user;
    data["course"] =  course;
    return data;
  }
}
