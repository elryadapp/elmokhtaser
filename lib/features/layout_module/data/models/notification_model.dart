
class NotificationModel {
    List<NotificationItemModel>? data;
    int? status;

    NotificationModel({this.data, this.status});

    NotificationModel.fromJson(Map<String, dynamic> json) {
        data = json["data"]==null ? null : (json["data"] as List).map((e)=>NotificationItemModel.fromJson(e)).toList();
        status = json["status"];
    }

    Map<String, dynamic> toJson() {
        final data = <String, dynamic>{};
        if(this.data != null){
            data["data"] = this.data?.map((e)=>e.toJson()).toList();
        }
        data["status"] = status;
        return data;
    }
}

class NotificationItemModel {
    String? id;
    String? type;
    dynamic readAt;
    String? course;
    String? createdAt;

    NotificationItemModel({this.id, this.type, this.readAt, this.course, this.createdAt});

    NotificationItemModel.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        type = json["type"];
        readAt = json["read_at"];
        course = json["course"];
        createdAt = json["created_at"];
    }

    Map<String, dynamic> toJson() {
        final data = <String, dynamic>{};
        data["id"] = id;
        data["type"] = type;
        data["read_at"] = readAt;
        data["course"] = course;
        data["created_at"] = createdAt;
        return data;
    }
}