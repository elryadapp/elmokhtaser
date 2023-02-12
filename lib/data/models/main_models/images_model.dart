class ElmokhtaserImageModel {
  ImagesData? data;
  int? status;

  ElmokhtaserImageModel({data, status});

  ElmokhtaserImageModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? ImagesData.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class ImagesData {
  String? imageLogin;
  String? imageRegister;
  String? imageJoinUs;
  String? imageTopLogo;
  String? imageFooterLogo;
  String? imageFav;

  ImagesData(
      {imageLogin,
      imageRegister,
      imageJoinUs,
      imageTopLogo,
      imageFooterLogo,
      imageFav});

  ImagesData.fromJson(Map<String, dynamic> json) {
    imageLogin = json['image_login'];
    imageRegister = json['image_register'];
    imageJoinUs = json['image_join_us'];
    imageTopLogo = json['image_top_logo'];
    imageFooterLogo = json['image_footer_logo'];
    imageFav = json['image_fav'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['image_login'] = imageLogin;
    data['image_register'] = imageRegister;
    data['image_join_us'] = imageJoinUs;
    data['image_top_logo'] = imageTopLogo;
    data['image_footer_logo'] = imageFooterLogo;
    data['image_fav'] = imageFav;
    return data;
  }
}
