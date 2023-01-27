class PasswordEditingModel {
  String? oldPassword;
  String? newPassword;
  String? newPasswordConfirmation;
  String? method;
  PasswordEditingModel(
      {this.oldPassword,
      this.newPassword,
      this.method,
      this.newPasswordConfirmation});
  PasswordEditingModel.fromJson(Map<String, dynamic> json) {
    
    oldPassword = json['current_password'];
    newPassword = json['new_password'];
    newPasswordConfirmation = json['confirm_password'];
    method = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['current_password'] = oldPassword;
    data['new_password'] = newPassword;
    data['confirm_password'] = newPasswordConfirmation;
    data['_method']=method;
    return data;
  }
}
