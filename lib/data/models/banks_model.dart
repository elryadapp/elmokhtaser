
class BanksModel {
    List<SingleBankData>? data;
    int? status;

    BanksModel({this.data, this.status});

    BanksModel.fromJson(Map<String, dynamic> json) {
        data = json["data"]==null ? null : (json["data"] as List).map((e)=>SingleBankData.fromJson(e)).toList();
        status = json["status"];
    }

    Map<String, dynamic> toJson() {
        final  data = <String, dynamic>{};
        if(this.data != null){
            data["data"] = this.data?.map((e)=>e.toJson()).toList();
        }
        data["status"] = status;
        return data;
    }
}

class SingleBankData {
    int? id;
    String? name;
    String? accountNumber;
    String? iban;

    SingleBankData({this.id, this.name, this.accountNumber, this.iban});

    SingleBankData.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        name = json["name"];
        accountNumber = json["account_number"];
        iban = json["iban"];
    }

    Map<String, dynamic> toJson() {
        final  data = <String, dynamic>{};
        data["id"] = id;
        data["name"] = name;
        data["account_number"] = accountNumber;
        data["iban"] = iban;
        return data;
    }
}