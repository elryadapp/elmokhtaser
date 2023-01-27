
class AttemptsModel {
    List<SingleAttempt>? data;
    int? status;

    AttemptsModel({this.data, this.status});

    AttemptsModel.fromJson(Map<String, dynamic> json) {
        data = json["data"]==null ? null : (json["data"] as List).map((e)=>SingleAttempt.fromJson(e)).toList();
        status = json["status"];
    }

    Map<String, dynamic> toJson() {
        final data = <String, dynamic>{};
        if(this.data != null){
            data["data"] = this.data?.map((e)=>e.toJson()).toList();
        }
        data["status"] =status;
        return data;
    }
}

class SingleAttempt {
    int? id;
    String? level;

    SingleAttempt({this.id, this.level});

    SingleAttempt.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        level = json["level"];
    }

    Map<String, dynamic> toJson() {
        final  data = <String, dynamic>{};
        data["id"] =    id;
        data["level"] = level;
        return data;
    }
}