

class SendCartModel {
  String? userAccountName;
  String? bankName;
  String? transferDate;
  String? type;
 dynamic image;
  List<dynamic>? courses;
  List<dynamic>? coupons;
  List<dynamic>? differences;
  List<dynamic>? prices;

  SendCartModel(
      {this.userAccountName,
      this.bankName,
      this.transferDate,
      this.type,
      this.image,
      this.courses,
      this.coupons,
      this.differences,
      this.prices});

  SendCartModel.fromJson(Map<String, dynamic> json) {
    userAccountName = json["user_account_name"];
    bankName = json["bank_name"];
    transferDate = json["transfer_date"];
    type = json["type"];
    image = json["image"];
    courses = json["courses"] ?? [];
    coupons = json["coupons"] ?? [];
    differences = json["differences"] ?? [];
    prices = json["prices"] ?? [];
  }

  Map<String, String> toJson(coursesLength) {
    final data = <String, String>{};
    data["user_account_name"] = userAccountName.toString();
    data["bank_name"] = bankName.toString();
    data["transfer_date"] = transferDate.toString();
    data["type"] = type.toString();
    if (courses != null) {
      for (int courseItemIndex = 0;
          courseItemIndex < coursesLength;
          courseItemIndex++) {
        data["courses[$courseItemIndex]"] = courses![courseItemIndex].toString();
      }
    }
    if (coupons != null) {
      for(int couponIndex=0;couponIndex<coursesLength;couponIndex++){
              data["coupons[$couponIndex]"] = coupons![couponIndex].toString();

      }
    }
    if (differences != null) {
      for(int differencesIndex=0;differencesIndex<coursesLength;differencesIndex++)
      {
      data["differences[$differencesIndex]"] = differences![differencesIndex].toString();
      }
    }
    if (prices != null) {
      for(int priceIndex=0;priceIndex<coursesLength;priceIndex++){
      data["prices[$priceIndex]"] = prices![priceIndex].toString();
      }
    }
    return data;
  }
}
