
class CategoriesModel {
    List<CategoryItem>? data;
    int? status;

    CategoriesModel({this.data, this.status});

    CategoriesModel.fromJson(Map<String, dynamic> json) {
        data = json["data"]==null ? null : (json["data"] as List).map((e)=>CategoryItem.fromJson(e)).toList();
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

class CategoryItem {
    int? id;
    String? title;
    String? image;
    String? type;
    dynamic parent;
    List<Childs>? childs;

    CategoryItem({this.id, this.title, this.image, this.type, this.parent, this.childs});

    CategoryItem.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        title = json["title"];
        image = json["image"];
        type = json["type"];
        parent = json["parent"];
        childs = json["childs"]==null ? null : (json["childs"] as List).map((e)=>Childs.fromJson(e)).toList();
    }

    Map<String, dynamic> toJson() {
        final data = <String, dynamic>{};
        data["id"] =   id;
        data["title"] =title;
        data["image"] =image;
        data["type"] =   type;
        data["parent"] = parent;
        if(childs != null){
            data["childs"] = childs?.map((e)=>e.toJson()).toList();}
        return data;
    }
}

class Childs {
    String? title;
    String? type;
    String? image;
    dynamic parent;

    Childs({this.title, this.type, this.image, this.parent});

    Childs.fromJson(Map<String, dynamic> json) {
        title = json["title"];
        type = json["type"];
        image = json["image"];
        parent = json["parent"];
    }

    Map<String, dynamic> toJson() {
        final data = <String, dynamic>{};
        data["title"] =  title;
        data["type"] =   type;
        data["image"] =  image;
        data["parent"] = parent;
        return data;
    }
}