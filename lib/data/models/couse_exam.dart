class CourseExamModel {
  CourseExamItem? data;
  int? status;

  CourseExamModel({this.data, this.status});

  CourseExamModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : CourseExamItem.fromJson(json["data"]);
    status = json["status"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.data != null) {
      data["data"] = this.data?.toJson();
    }
    data["status"] = status;
    return data;
  }
}

class CourseExamItem {
  List<Questions>? questions;
  int? exam;
  int? studentExamId;
  dynamic timer;
  

  CourseExamItem({this.questions, this.exam, this.studentExamId, this.timer});

  CourseExamItem.fromJson(Map<String, dynamic> json) {
    questions = json["questions"] == null
        ? null
        : (json["questions"] as List)
            .map((e) => Questions.fromJson(e))
            .toList();
    exam = json["exam"];
    studentExamId = json["student_exam_id"];
    timer = json["timer"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (questions != null) {
      data["questions"] = questions?.map((e) => e.toJson()).toList();
    }
    data["exam"] = exam;
    data["student_exam_id"] = studentExamId;
    data["timer"] = timer;
    return data;
  }
}

class Questions {
  String? question;
  int? id;
  String? questionDetails;
  int? degree;
  String? answer1;
  String? answer2;
  String? answer3;
  String? answer4;
  String? trueAnswer;
  dynamic image;
  String? videoUrl;
  dynamic hint;
  dynamic hintImage;
  dynamic hintVideo;
  String? type;
  String? subject;

  Questions(
      {this.question,
      this.id,
      this.questionDetails,
      this.degree,
      this.answer1,
      this.answer2,
      this.answer3,
      this.answer4,
      this.trueAnswer,
      this.image,
      this.videoUrl,
      this.hint,
      this.hintImage,
      this.hintVideo,
      this.type,
      this.subject});

  Questions.fromJson(Map<String, dynamic> json) {
    question = json["question"];
    id=json['id'];
    questionDetails = json["question_details"];
    degree = json["degree"];
    answer1 = json["answer1"];
    answer2 = json["answer2"];
    answer3 = json["answer3"];
    answer4 = json["answer4"];
    trueAnswer = json["true_answer"];
    image = json["image"];
    videoUrl = json["video_url"];
    hint = json["hint"];
    hintImage = json["hint_image"];
    hintVideo = json["hint_video"];
    type = json["type"];
    subject = json["subject"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["question"] = question;
    data['id']=id;
    data["question_details"] = questionDetails;
    data["degree"] = degree;
    data["answer1"] = answer1;
    data["answer2"] = answer2;
    data["answer3"] = answer3;
    data["answer4"] = answer4;
    data["true_answer"] = trueAnswer;
    data["image"] = image;
    data["video_url"] = videoUrl;
    data["hint"] = hint;
    data["hint_image"] = hintImage;
    data["hint_video"] = hintVideo;
    data["type"] = type;
    data["subject"] = subject;
    return data;
  }
}


//==========================================================
class MatchingQuestion {
    List<MQuestion>? question;

    MatchingQuestion({this.question});

    MatchingQuestion.fromJson(Map<String, dynamic> json) {
        question = json["question"]==null ? null : (json["question"] as List).map((e)=>MQuestion.fromJson(e)).toList();
    }

    Map<String, dynamic> toJson() {
        final  data = <String, dynamic>{};
        if(question != null)
            {data["question"] = question?.map((e)=>e.toJson()).toList();}
        return data;
    }
}

class MQuestion {
    int? qn;
    String? q;
    int? an;
    String? a;

    MQuestion({this.qn, this.q, this.an, this.a});

    MQuestion.fromJson(Map<String, dynamic> json) {
        qn = json["qn"];
        q = json["q"];
        an = json["an"];
        a = json["a"];
    }

    Map<String, dynamic> toJson() {
        final  data = <String, dynamic>{};
        data["qn"] = qn;
        data["q"] =  q;
        data["an"] = an;
        data["a"] =  a;
        return data;
    }
}