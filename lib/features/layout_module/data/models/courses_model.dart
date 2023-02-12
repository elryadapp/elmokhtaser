class CoursesModel {
  List<CourseItem>? data;
  int? status;

  CoursesModel({
    this.data,
    this.status,
  });

  CoursesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CourseItem>[];
      json['data'].forEach((v) {
        data!.add(CourseItem.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;

    return data;
  }
}

class CourseItem {
  int? id;
  String? title;
  String? desc;
  int? price;
  int? priceAfter;
  String? type;
  String? image;
  String? previewVideo;
  String? courseTable;
  String? courseBag;
  String? peroid;
  String? startDate;
  int? averageRate;
  int? ratingCount;
  int? subscribers;
  bool? subscribed;
  int? progress;
  bool? rated;
  String? category;
  List<String>? teachers;
  List<Comments>? comments;
  List<Questions>? questions;
  List<Results>? results;

  CourseItem(
      {id,
      title,
      desc,
      price,
      priceAfter,
      type,
      image,
      previewVideo,
      courseTable,
      courseBag,
      peroid,
      startDate,
      averageRate,
      ratingCount,
      subscribers,
      subscribed,
      progress,
      rated,
      category,
      teachers,
      comments,
      questions,
      results});

  CourseItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    desc = json['desc'];
    price = json['price'];
    priceAfter = json['price_after'];
    type = json['type'];
    image = json['image'];
    previewVideo = json['preview_video'];
    courseTable = json['course_table'];
    courseBag = json['course_bag'];
    peroid = json['peroid'];
    startDate = json['start_date'];
    averageRate = json['averageRate'];
    ratingCount = json['ratingCount'];
    subscribers = json['subscribers'];
    subscribed = json['subscribed'];
    progress = json['progress'];
    rated = json['rated'];
    category = json['category'];
    teachers = json['teachers'].cast<String>();
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['desc'] = desc;
    data['price'] = price;
    data['price_after'] = priceAfter;
    data['type'] = type;
    data['image'] = image;
    data['preview_video'] = previewVideo;
    data['course_table'] = courseTable;
    data['course_bag'] = courseBag;
    data['peroid'] = peroid;
    data['start_date'] = startDate;
    data['averageRate'] = averageRate;
    data['ratingCount'] = ratingCount;
    data['subscribers'] = subscribers;
    data['subscribed'] = subscribed;
    data['progress'] = progress;
    data['rated'] = rated;
    data['category'] = category;
    data['teachers'] = teachers;
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comments {
  int? id;
  String? comment;
  String? rating;
  String? user;
  bool? me;
  String? course;

  Comments({id, comment, rating, user, me, course});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    rating = json['rating'];
    user = json['user'];
    me = json['me'];
    course = json['course'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['comment'] = comment;
    data['rating'] = rating;
    data['user'] = user;
    data['me'] = me;
    data['course'] = course;
    return data;
  }
}

class Results {
  String? studentName;
  String? image;

  Results({studentName, image});

  Results.fromJson(Map<String, dynamic> json) {
    studentName = json['student_name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['student_name'] = studentName;
    data['image'] = image;
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
    data["answer"] = answer;
    return data;
  }
}
