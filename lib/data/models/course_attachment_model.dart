
class CourseAttachmentModel {
    List<AttachmentItem>? data;
    int? status;

    CourseAttachmentModel({this.data, this.status});

    CourseAttachmentModel.fromJson(Map<String, dynamic> json) {
        data = json["data"]==null ? null : (json["data"] as List).map((e)=>AttachmentItem.fromJson(e)).toList();
        status = json["status"];
    }

    Map<String, dynamic> toJson() {
        final  data = <String, dynamic>{};
        if(this.data != null){
            data["data"] = this.data?.map((e)=>e.toJson()).toList();
        }
        data["status"] = status;
        return data;
    }
}

class AttachmentItem {
    String? title;
    String? type;
    int? download;
    String? link;

    AttachmentItem({this.title, this.type, this.download, this.link});

    AttachmentItem.fromJson(Map<String, dynamic> json) {
        title = json["title"];
        type = json["type"];
        download = json["download"];
        link = json["link"];
    }

    Map<String, dynamic> toJson() {
        final data = <String, dynamic>{};
        data["title"] =    title;
        data["type"] =     type;
        data["download"] = download;
        data["link"] = link;
        return data;
    }
}