
class SingleNewsDetails {
    SingleNewsDetailsData? data;
    int? status;

    SingleNewsDetails({this.data, this.status});

    SingleNewsDetails.fromJson(Map<String, dynamic> json) {
        data = json["data"] == null ? null : SingleNewsDetailsData.fromJson(json["data"]);
        status = json["status"];
    }

    Map<String, dynamic> toJson() {
        final  data = <String, dynamic>{};
        if(this.data != null)
            {data["data"] = this.data?.toJson();}
        data["status"] = status;
        return data;
    }
}

class SingleNewsDetailsData {
    int? id;
    String? title;
    String? content;
    String? image;
    String? createdAt;

    SingleNewsDetailsData({this.id, this.title, this.content, this.image, this.createdAt});

    SingleNewsDetailsData.fromJson(Map<String, dynamic> json) {
       id = json["id"];
       title = json["title"];
       content = json["content"];
       image = json["image"];
       createdAt = json["created_at"];
    }

    Map<String, dynamic> toJson() {
        final data = <String, dynamic>{};
        data["id"] =    id;
        data["title"] = title;
        data["content"] = content;
        data["image"] =   image;
        data["created_at"] = createdAt;
        return data;
    }
}