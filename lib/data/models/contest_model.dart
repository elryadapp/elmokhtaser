
class ContestModel {
    List<ContestItemModel>? data;
    int? status;

    ContestModel({this.data, this.status});

    ContestModel.fromJson(Map<String, dynamic> json) {
        data = json["data"]==null ? null : (json["data"] as List).map((e)=>ContestItemModel.fromJson(e)).toList();
        status = json["status"];
    }

    Map<String, dynamic> toJson() {
        final  data =  <String, dynamic>{};
        if(this.data != null)
            {data["data"] = this.data?.map((e)=>e.toJson()).toList();}
        data["status"] = status;
        return data;
    }
}

class ContestItemModel {
    int? id;
    int? questionsNumber;
    int? examTime;
    int? attemps;
    String? teacherId;
    String? mainCat;
    String? level;

    ContestItemModel({this.id, this.questionsNumber, this.examTime, this.attemps, this.teacherId, this.mainCat, this.level});

    ContestItemModel.fromJson(Map<String, dynamic> json) {
        id = json["id"];
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
        data["questions_number"] = questionsNumber;
        data["exam_time"] = examTime;
        data["attemps"] = attemps;
        data["teacher_id"] = teacherId;
        data["main_cat"] = mainCat;
        data["level"] = level;
        return data;
    }
}