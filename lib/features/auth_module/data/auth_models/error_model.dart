
class ErrorModel {
    Data? data;
    int? status;

    ErrorModel({this.data, this.status});

    ErrorModel.fromJson(Map<String, dynamic> json) {
       data = json["data"] == null ? null : Data.fromJson(json["data"]);
       status = json["status"];
    }

    Map<String, dynamic> toJson() {
        final  data = <String, dynamic>{};
        if(this.data != null)
           { data["data"] = this.data?.toJson();}
        data["status"] = status;
        return data;
    }
}

class Data {
    dynamic name;
    dynamic email;
    dynamic phone;
    dynamic password;

    Data({this.name, this.email, this.phone, this.password});

    Data.fromJson(Map<String, dynamic> json) {
        name = json["name"]==null ? null : json["name"] as dynamic;
        email = json["email"]==null ? null :json["email"] as dynamic;
        phone = json["phone"]==null ? null : json["phone"] as dynamic;
        password = json["password"]==null ? null : json["password"]as dynamic;
    }

    Map<String, dynamic> toJson() {
        final data = <String, dynamic>{};
        if(name != null)
           {data["name"] = name;} 
        if(email != null)
           { data["email"] = email;}
        if(phone != null)
           { data["phone"] = phone;}
        if(password != null)
           { data["password"] = password;}
        return data;
    }
}