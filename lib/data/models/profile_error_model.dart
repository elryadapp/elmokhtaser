
class ProfileErrorModel {
    ProfileError? data;
    int? status;

    ProfileErrorModel({this.data, this.status});

    ProfileErrorModel.fromJson(Map<String, dynamic> json) {
        data = json["data"] == null ? null : ProfileError.fromJson(json["data"]);
        status = json["status"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        if(this.data != null){
            data["data"] = this.data?.toJson();
        }
        data["status"] = status;
        return data;
    }
}

class ProfileError {
    List<String>? currentPassword;
    List<String>? newPassword;
    List<String>? confirmPassword;

    ProfileError({this.currentPassword, this.newPassword, this.confirmPassword});

    ProfileError.fromJson(Map<String, dynamic> json) {
        currentPassword = json["current_password"]==null ? null : List<String>.from(json["current_password"]);
        newPassword = json["new_password"]==null ? null : List<String>.from(json["new_password"]);
        confirmPassword = json["confirm_password"]==null ? null : List<String>.from(json["confirm_password"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data =  <String, dynamic>{};
        if(currentPassword != null){
            data["current_password"] = currentPassword;
        }
        if(newPassword != null){
            data["new_password"] = newPassword;
        }
        if(confirmPassword != null){
            data["confirm_password"] = confirmPassword;
        }
        return data;
    }
}