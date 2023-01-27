
class PaymentErrorClass {
    Data? data;
    int? status;

    PaymentErrorClass({this.data, this.status});

    PaymentErrorClass.fromJson(Map<String, dynamic> json) {
        data = json["data"] == null ? null : Data.fromJson(json["data"]);
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

class Data {
    List<String>? userAccountName;
    List<String>? bankName;
    List<String>? transferDate;

    Data({this.userAccountName, this.bankName, this.transferDate});

    Data.fromJson(Map<String, dynamic> json) {
        userAccountName = json["user_account_name"]==null ? null : List<String>.from(json["user_account_name"]);
        bankName = json["bank_name"]==null ? null : List<String>.from(json["bank_name"]);
        transferDate = json["transfer_date"]==null ? null : List<String>.from(json["transfer_date"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        if(userAccountName != null){
            data["user_account_name"] = userAccountName;
        }
        if(bankName != null)
          {  data["bank_name"] = bankName;}
        if(transferDate != null)
           { data["transfer_date"] = transferDate;}
        return data;
    }
}