
class UserExamModel {
    List<UserExamItem>? data;
    int? status;

    UserExamModel({this.data, this.status});

    UserExamModel.fromJson(Map<String, dynamic> json) {
        data = json["data"]==null ? null : (json["data"] as List).map((e)=>UserExamItem.fromJson(e)).toList();
        status = json["status"];
    }

    Map<String, dynamic> toJson() {
        final data = <String, dynamic>{};
        if(this.data != null){
            data["data"] = this.data?.map((e)=>e.toJson()).toList();}
        data["status"] = status;
        return data;
    }
}

class UserExamItem {
    int? id;
    int? questionsNumber;
    int? examTime;
    int? attemps;
    String? teacherId;
    String? mainCat;
    String? level;
    dynamic rest;
    String? type;

    UserExamItem({this.id, this.type,this.rest,this.questionsNumber, this.examTime, this.attemps, this.teacherId, this.mainCat, this.level});

    UserExamItem.fromJson(Map<String, dynamic> json) {
       id = json["id"];
       type=json["type"];
       rest=json['rest'];
       questionsNumber = json["questions_number"];
       examTime = json["exam_time"];
       attemps = json["attemps"];
       teacherId = json["teacher_id"];
       mainCat = json["main_cat"];
       level = json["level"];
    }

    Map<String, dynamic> toJson() {
        final data = <String, dynamic>{};
        data["id"] = id;
        data["type"]=type;
        data['rest']=rest;
        data["questions_number"] = questionsNumber;
        data["exam_time"] = examTime;
        data["attemps"] = attemps;
        data["teacher_id"] = teacherId;
        data["main_cat"] = mainCat;
        data["level"] = level;
        return data;
    }
}