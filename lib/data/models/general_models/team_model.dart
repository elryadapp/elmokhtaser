
class Teams {
    List<TeamItem>? data;
    int? status;

    Teams({this.data, this.status});

    Teams.fromJson(Map<String, dynamic> json) {
       data = json["data"]==null ? null : (json["data"] as List).map((e)=>TeamItem.fromJson(e)).toList();
       status = json["status"];
    }

    Map<String, dynamic> toJson() {
        final  data = <String, dynamic>{};
        if(this.data != null){
            data["data"] = this.data?.map((e)=>e.toJson()).toList();}
        data["status"] = status;
        return data;
    }
}

class TeamItem {
    int? id;
    String? name;
    String? job;
    String? image;

    TeamItem({this.id, this.name, this.job, this.image});

    TeamItem.fromJson(Map<String, dynamic> json) {
       id = json["id"];
       name = json["name"];
       job = json["job"];
       image = json["image"];
    }

    Map<String, dynamic> toJson() {
        final data = <String, dynamic>{};
        data["id"] =    id;
        data["name"] =  name;
        data["job"] =   job;
        data["image"] = image;
        return data;
    }
}