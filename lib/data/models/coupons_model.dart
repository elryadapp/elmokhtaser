
class CouponsModel {
    List<CouponItem>? data;
    int? status;

    CouponsModel({this.data, this.status});

    CouponsModel.fromJson(Map<String, dynamic> json) {
        data = json["data"]==null ? null :( json["data"] as List).map((e)=>CouponItem.fromJson(e)).toList();
        status = json["status"];
    }

    Map<String, dynamic> toJson() {
        final  data =<String, dynamic>{};
        if(this.data != null){
            data["data"] = this.data?.map((e)=>e.toJson()).toList();
        }
        data["status"] = status;
        return data;
    }
}

class CouponItem {
    int? id;
    String? coupon;
    String? type;
    int? discount;
    int? useNumber;
    String? course;
    int? courseId;
    dynamic price;

    CouponItem({this.id,this.price, this.courseId,this.coupon, this.type, this.discount, this.useNumber, this.course});

    CouponItem.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        price=json["price"];

        courseId=json["course_id"];
        coupon = json["coupon"];
        type = json["type"];
        discount = json["discount"];
        useNumber = json["use_number"];
        course = json["course"];
    }

    Map<String, dynamic> toJson() {
        final  data =<String, dynamic>{};
        data["id"] =     id;
        data["price"]=price;
        data["course_id"]=courseId;
        data["coupon"] = coupon;
        data["type"] =   type;
        data["discount"] =   discount;
        data["use_number"] = useNumber;
        data["course"] = course;
        return data;
    }
}