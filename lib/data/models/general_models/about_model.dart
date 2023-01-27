
class About {
    AboutItem? data;
    int? status;

    About({this.data, this.status});

    About.fromJson(Map<String, dynamic> json) {
        data = json["data"] == null ? null : AboutItem.fromJson(json["data"]);
        status = json["status"];
    }

    Map<String, dynamic> toJson() {
        final  data = <String, dynamic>{};
        if(this.data != null){
            data["data"] = this.data?.toJson();
            }
        data["status"] = status;
        return data;
    }
}

class AboutItem {
    int? id;
    String? about;
    String? image;
    String? cover;

    AboutItem({this.id, this.about, this.image, this.cover});

    AboutItem.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        about = json["about"];
        image = json["image"];
        cover = json["cover"];
    }

    Map<String, dynamic> toJson() {
        final data = <String, dynamic>{};
        data["id"] =    id;
        data["about"] = about;
        data["image"] = image;
        data["cover"] = cover;
        return data;
    }
}