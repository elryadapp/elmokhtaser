class CourseContentModel {
  List<CourseContentSection>? data;
  dynamic status;

  CourseContentModel({this.data, this.status});

  CourseContentModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List)
            .map((e) => CourseContentSection.fromJson(e))
            .toList();
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

class CourseContentSection {
  String? title;
  String? type;
  int? id;
  List<CourseContentChilds>? childs;

  CourseContentSection({this.title, this.type, this.childs});

  CourseContentSection.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    id=json['id'];
    type = json["type"];
    childs = json["childs"] == null
        ? null
        : (json["childs"] as List).map((e) => CourseContentChilds.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["title"] = title;
    data['id']=id;
    data["type"] = type;
    if (childs != null) {
      data["childs"] = childs?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class CourseContentChilds {
  String? title;
  int? id;
  String? desc;
  int? attemptsCount;
  int? attemptsBefore;

  String? type;
  String? videoUrl;
  dynamic questionsNumber;
  dynamic examTime;
  dynamic liveUrl;
  dynamic recordedUrl;
  dynamic zoomTime;
  dynamic attachement;
  dynamic download;
  String? course;
  dynamic progressable;

  CourseContentChilds(
      {this.title,
      this.progressable,
      this.id,
      this.type,
      this.videoUrl,
      this.questionsNumber,
      this.examTime,
      this.liveUrl,
      this.recordedUrl,
      this.zoomTime,
      this.attachement,
      this.download,
      this.course});

  CourseContentChilds.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    progressable = json['progressable'];
    id = json['id'];

    desc = json['desc'];
    attemptsCount = json['attempts_count'];
    attemptsBefore = json['attempts_before'];
    type = json["type"];
    videoUrl = json["video_url"];
    questionsNumber = json["questions_number"];
    examTime = json["exam_time"];
    liveUrl = json["live_url"];
    recordedUrl = json["recorded_url"];
    zoomTime = json["zoom_time"];
    attachement = json["attachement"];
    download = json["download"];
    course = json["course"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["title"] = title;

    data['desc'] = desc;
    data['attempts_count'] = attemptsCount;
    data['attempts_before'] = attemptsBefore;
    data['progressable'] = progressable;
    data['id'] = id;
    data["type"] = type;
    data["video_url"] = videoUrl;
    data["questions_number"] = questionsNumber;
    data["exam_time"] = examTime;
    data["live_url"] = liveUrl;
    data["recorded_url"] = recordedUrl;
    data["zoom_time"] = zoomTime;
    data["attachement"] = attachement;
    data["download"] = download;
    data["course"] = course;
    return data;
  }
}
