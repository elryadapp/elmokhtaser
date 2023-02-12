class RegisterDataModel {
  String? name;
  String? email;
  String? phone;
  String? password;
  String? passwordConfirm;
  String? educationLeve;
  String? level;
  String? code;
  String? googleDeviceToken;

  RegisterDataModel(
      {this.name,
      this.email,
      this.code,
      this.googleDeviceToken,
      this.phone,
      this.password,
      this.passwordConfirm,
      this.educationLeve,
      this.level});
         Map<String, dynamic> toJson() {
        final  data =<String, dynamic>{};
        data["google_device_token"]=googleDeviceToken;
        data["name"] =  name;
        data['code']=code;
        data["email"] = email;
        data["phone"] = phone;
          data["password"] =  password;
        data["password_confirmation"] = passwordConfirm;
        data["educational_level"] = educationLeve;
        data['level']=level;
        return data;
    }
}
