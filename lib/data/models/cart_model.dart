
class CartModel {
    List<CartItemModel>? data;
        dynamic total;

    int? status;

    CartModel({this.data,this.total ,this.status});

    CartModel.fromJson(Map<String, dynamic> json) {
        data = json["data"]==null ? null : (json["data"] as List).map((e)=>CartItemModel.fromJson(e)).toList();
        status = json["status"];
                total=json["total"];

    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        if(this.data != null){
            data["data"] = this.data?.map((e)=>e.toJson()).toList();
        }
                data["total"]=total;

        data["status"] = status;
        return data;
    }
}

class CartItemModel {
    int? id;
    int? courseId;
    String? title;
    String? image;
    String? peroid;
    int? price;
    dynamic coupon;
    dynamic difference;

    CartItemModel({this.id,this.courseId, this.title, this.image, this.peroid, this.price, this.coupon, this.difference});

    CartItemModel.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        courseId = json["course_id"];
        title = json["title"];
        image = json["image"];
        peroid = json["peroid"];
        price = json["price"];
        coupon = json["coupon"];
        difference = json["difference"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data["id"] = id;
        data["course_id"] = courseId;
        data["title"] = title;
        data["image"] = image;
        data["peroid"] = peroid;
        data["price"] = price;
        data["coupon"] = coupon;
        data["difference"] = difference;
        return data;
    }
}