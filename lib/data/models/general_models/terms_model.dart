
class TermsAndCondition {
    List<TermesAndConditionData>? data;
    int? status;

    TermsAndCondition({this.data, this.status});

    TermsAndCondition.fromJson(Map<String, dynamic> json) {
        data = json["data"]==null ? null : (json["data"] as List).map((e)=>TermesAndConditionData.fromJson(e)).toList();
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

class TermesAndConditionData {
    int? id;
    String? title;
    String? content;

    TermesAndConditionData({this.id, this.title, this.content});

    TermesAndConditionData.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        title = json["title"];
        content = json["content"];
    }

    Map<String, dynamic> toJson() {
        final data = <String, dynamic>{};
        data["id"] =      id;
        data["title"] =   title;
        data["content"] = content;
        return data;
    }
}