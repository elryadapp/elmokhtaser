
class UserModel {
    UserData? data;
    dynamic status;

    UserModel({this.data, this.status});

    UserModel.fromJson(Map<String, dynamic> json) {
        data = json["data"] == null ? null : UserData.fromJson(json["data"]);
        status = json["status"];
    }

    Map<String, dynamic> toJson() {
        final  data = <String, dynamic>{};
        if(this.data != null)
        {
                      data["data"] = this.data?.toJson();

        }
        data["status"] = status;
        return data;
    }
}

class UserData {
    int? id;
    String? method;
    dynamic name;
    dynamic email;
    String? phone;
    dynamic image;
    int? active;
    dynamic code;
    String? token;

    UserData({this.method,this.id, this.name, this.email, this.phone, this.image, this.active, this.code, this.token});

    UserData.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        image=json["image"];
        method=json["_method"];
        name = json["name"];
        email = json["email"];
        phone = json["phone"];
        active = json["active"];
        code = json["code"];
        token = json["token"];
    }

    Map<String, dynamic> toJson() {
        final  data =<String, dynamic>{};
        data["id"] =    id;
        data['_method']=method;
        data["name"] =  name;
        data["email"] = email;
        data["phone"] = phone;
        data["image"] = image;
        data["active"] = active;
        data["code"] =   code;
        data["token"] =  token;
        return data;
    }
}