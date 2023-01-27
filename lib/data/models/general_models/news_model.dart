
class News {
    List<NewsItem>? data;
    int? status;

    News({this.data, this.status});

    News.fromJson(Map<String, dynamic> json) {
        data = json["data"]==null ? null : (json["data"] as List).map((e)=>NewsItem.fromJson(e)).toList();
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

class NewsItem {
    int? id;
    String? title;
    String? content;
    String? image;
    String? createdAt;

    NewsItem({this.id, this.title, this.content, this.image, this.createdAt});

    NewsItem.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        title = json["title"];
        content = json["content"];
        image = json["image"];
        createdAt = json["created_at"];
    }

    Map<String, dynamic> toJson() {
        final  data = <String, dynamic>{};
        data["id"] =    id;
        data["title"] = title;
        data["content"] = content;
        data["image"] =   image;
        data["created_at"] = createdAt;
        return data;
    }
}