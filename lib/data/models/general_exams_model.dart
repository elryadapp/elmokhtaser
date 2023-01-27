
class GeneralExamCategories {
    List<GeneralExamItem>? data;
    int? status;

    GeneralExamCategories({this.data, this.status});

    GeneralExamCategories.fromJson(Map<String, dynamic> json) {
        data = json["data"]==null ? null : (json["data"] as List).map((e)=>GeneralExamItem.fromJson(e)).toList();
        status = json["status"];
    }

    Map<String, dynamic> toJson() {
        final  data = <String, dynamic>{};
        if(this.data != null)
            {data["data"] = this.data?.map((e)=>e.toJson()).toList();}
        data["status"] =status;
        return data;
    }
}

class GeneralExamItem {
    int? id;
    String? title;
    String? image;
    String? type;
    dynamic parent;
    List<GeneralExamsChilds>? childs;

    GeneralExamItem({this.id, this.title, this.image, this.type, this.parent, this.childs});

    GeneralExamItem.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        title = json["title"];
        image = json["image"];
        type = json["type"];
        parent = json["parent"];
        childs = json["childs"]==null ? null : (json["childs"] as List).map((e)=>GeneralExamsChilds.fromJson(e)).toList();
    }

    Map<String, dynamic> toJson() {
        final  data = <String, dynamic>{};
        data["id"] =    id;
        data["title"] = title;
        data["image"] = image;
        data["type"] =   type;
        data["parent"] = parent;
        if(childs != null)
           { data["childs"] = childs?.map((e)=>e.toJson()).toList();}
        return data;
    }
}

class GeneralExamsChilds {
    int? id;
    String? title;
    String? type;
    String? image;
    Parent? parent;
    List<GeneralExams>? exams;

    GeneralExamsChilds({this.id, this.title, this.type, this.image, this.parent, this.exams});

    GeneralExamsChilds.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        title = json["title"];
        type = json["type"];
        image = json["image"];
        parent = json["parent"] == null ? null : Parent.fromJson(json["parent"]);
        exams = json["exams"]==null ? null : (json["exams"] as List).map((e)=>GeneralExams.fromJson(e)).toList();
    }

    Map<String, dynamic> toJson() {
        final data = <String, dynamic>{};
        data["id"] =    id;
        data["title"] = title;
        data["type"] =  type;
        data["image"] = image;
        if(parent != null)
           { data["parent"] = parent?.toJson();}
        if(exams != null){
            data["exams"] =exams?.map((e)=>e.toJson()).toList();
        }
        return data;
    }
}

class GeneralExams {
    int? id;
    int? questionsNumber;
    int? examTime;
    int? attemps;
    int? teacherId;
    int? mainCat;
    int? level;
    String? createdAt;
    String? updatedAt;

    GeneralExams({this.id, this.questionsNumber, this.examTime, this.attemps, this.teacherId, this.mainCat, this.level, this.createdAt, this.updatedAt});

    GeneralExams.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        questionsNumber = json["questions_number"];
        examTime = json["exam_time"];
        attemps = json["attemps"];
        teacherId = json["teacher_id"];
        mainCat = json["main_cat"];
        level = json["level"];
        createdAt = json["created_at"];
        updatedAt = json["updated_at"];
    }

    Map<String, dynamic> toJson() {
        final  data = <String, dynamic>{};
        data["id"] = id;
        data["questions_number"] =questionsNumber;
        data["exam_time"] = examTime;
        data["attemps"] =   attemps;
        data["teacher_id"] =teacherId;
        data["main_cat"] = mainCat;
        data["level"] =      level;
        data["created_at"] = createdAt;
        data["updated_at"] = updatedAt;
        return data;
    }
}

class Parent {
    int? id;
    String? titleAr;
    String? titleEn;
    String? image;
    String? type;
    dynamic parentId;
    String? createdAt;
    String? updatedAt;

    Parent({this.id, this.titleAr, this.titleEn, this.image, this.type, this.parentId, this.createdAt, this.updatedAt});

    Parent.fromJson(Map<String, dynamic> json) {
      id = json["id"];
      titleAr = json["title_ar"];
      titleEn = json["title_en"];
      image = json["image"];
      type = json["type"];
      parentId = json["parent_id"];
      createdAt = json["created_at"];
      updatedAt = json["updated_at"];
    }

    Map<String, dynamic> toJson() {
        final  data = <String, dynamic>{};
        data["id"] =       id;
        data["title_ar"] = titleAr;
        data["title_en"] = titleEn;
        data["image"] =    image;
        data["type"] =     type;
        data["parent_id"] =  parentId;
        data["created_at"] = createdAt;
        data["updated_at"] = updatedAt;
        return data;
    }
}