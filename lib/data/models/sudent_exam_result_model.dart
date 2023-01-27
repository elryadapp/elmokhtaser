class SutdentExamResultModel {
  ExamItemResultModel? data;
  int? status;

  SutdentExamResultModel({this.data, this.status});

  SutdentExamResultModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : ExamItemResultModel.fromJson(json["data"]);
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

class ExamItemResultModel {
  List<QuestionsResults>? questions;
  List<AnswersResult>? answers;
  int? rightAnswers;
  List<WrongAnswers>? wrongAnswers;
  int? uncompletedAnswers;

  ExamItemResultModel(
      {this.questions,
      this.answers,
      this.rightAnswers,
      this.wrongAnswers,
      this.uncompletedAnswers});

  ExamItemResultModel.fromJson(Map<String, dynamic> json) {
    questions = json["questions"] == null
        ? null
        : (json["questions"] as List)
            .map((e) => QuestionsResults.fromJson(e))
            .toList();
    answers = json["answers"] == null
        ? null
        : (json["answers"] as List)
            .map((e) => AnswersResult.fromJson(e))
            .toList();
    rightAnswers = json["right_answers"];
    wrongAnswers = json["wrong_answers"] == null
        ? null
        : (json["wrong_answers"] as List)
            .map((e) => WrongAnswers.fromJson(e))
            .toList();
    uncompletedAnswers = json["uncompleted_answers"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (questions != null) {
      data["questions"] = questions?.map((e) => e.toJson()).toList();
    }
    if (answers != null) {
      data["answers"] = answers?.map((e) => e.toJson()).toList();
    }
    data["right_answers"] = rightAnswers;
    if (wrongAnswers != null) {
      data["wrong_answers"] = wrongAnswers?.map((e) => e.toJson()).toList();
    }
    data["uncompleted_answers"] = uncompletedAnswers;
    return data;
  }
}

class WrongAnswers {
  int? id;
  String? studentAnswer;
  int? questionId;
  int? attempId;
  int? teacherDegree;
  String? type;
  String? createdAt;
  String? updatedAt;

  WrongAnswers(
      {this.id,
      this.studentAnswer,
      this.questionId,
      this.attempId,
      this.teacherDegree,
      this.type,
      this.createdAt,
      this.updatedAt});

  WrongAnswers.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    studentAnswer = json["student_answer"];
    questionId = json["question_id"];
    attempId = json["attemp_id"];
    teacherDegree = json["teacher_degree"];
    type = json["type"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["id"] = id;
    data["student_answer"] = studentAnswer;
    data["question_id"] = questionId;
    data["attemp_id"] = attempId;
    data["teacher_degree"] = teacherDegree;
    data["type"] = type;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    return data;
  }
}

class AnswersResult {
  int? id;
  String? studentAnswer;
  int? questionId;
  int? teacherDegree;
  String? type;

  AnswersResult(
      {this.id,
      this.studentAnswer,
      this.questionId,
      this.teacherDegree,
      this.type});

  AnswersResult.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    studentAnswer = json["student_answer"];
    questionId = json["question_id "];
    teacherDegree = json["teacher_degree"];
    type = json["type"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["id"] = id;
    data["student_answer"] = studentAnswer;
    data["question_id "] = questionId;
    data["teacher_degree"] = teacherDegree;
    data["type"] = type;
    return data;
  }
}

class QuestionsResults {
  int? id;
  String? question;
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

  QuestionsResults(
      {this.id,
      this.question,
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

  QuestionsResults.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    question = json["question"];
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
    data["id"] = id;
    data["question"] = question;
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
