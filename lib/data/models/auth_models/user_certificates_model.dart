
class UserCertificatesModel {
    List<CertificateItem>? data;
    int? status;

    UserCertificatesModel({this.data, this.status});

    UserCertificatesModel.fromJson(Map<String, dynamic> json) {
        data = json["data"]==null ? null : (json["data"] as List).map((e)=>CertificateItem.fromJson(e)).toList();
        status = json["status"];
    }

    Map<String, dynamic> toJson() {
        final  data = <String, dynamic>{};
        if(this.data != null){
            data["data"] = this.data?.map((e)=>e.toJson()).toList();}
        data["status"] = status;
        return data;
    }
}

class CertificateItem {
    int? id;
    Course? course;
    dynamic createdAt;
    String? updatedAt;

    CertificateItem({this.id, this.course, this.createdAt, this.updatedAt});

    CertificateItem.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        course = json["course"] == null ? null : Course.fromJson(json["course"]);
        createdAt = json["created_at"];
        updatedAt = json["updated_at"];
    }

    Map<String, dynamic> toJson() {
        final data = <String, dynamic>{};
        data["id"] = id;
        if(course != null){
            data["course"] = course?.toJson();
        }
        data["created_at"] = createdAt;
        data["updated_at"] = updatedAt;
        return data;
    }
}

class Course {
    String? title;
    String? image;
    List<Teachers>? teachers;

    Course({this.title, this.image, this.teachers});

    Course.fromJson(Map<String, dynamic> json) {
        title = json["title"];
        image = json["image"];
        teachers = json["teachers"]==null ? null : (json["teachers"] as List).map((e)=>Teachers.fromJson(e)).toList();
    }

    Map<String, dynamic> toJson() {
        final  data = <String, dynamic>{};
        data["title"] = title;
        data["image"] = image;
        if(teachers != null){
            data["teachers"] = teachers?.map((e)=>e.toJson()).toList();
        }
        return data;
    }
}

class Teachers {
    int? id;
    String? name;
    int? roleId;
    String? email;
    String? type;
    String? phone;
    dynamic image;
    String? subject;
    int? active;
    String? code;
    String? createdAt;
    String? updatedAt;
    Pivot? pivot;

    Teachers({this.id, this.name, this.roleId, this.email, this.type, this.phone, this.image, this.subject, this.active, this.code, this.createdAt, this.updatedAt, this.pivot});

    Teachers.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        name = json["name"];
        roleId = json["role_id"];
        email = json["email"];
        type = json["type"];
        phone = json["phone"];
        image = json["image"];
        subject = json["subject"];
        active = json["active"];
        code = json["code"];
        createdAt = json["created_at"];
        updatedAt = json["updated_at"];
        pivot = json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]);
    }

    Map<String, dynamic> toJson() {
        final  data =<String, dynamic>{};
        data["id"] =      id;
        data["name"] =    name;
        data["role_id"] = roleId;
        data["email"] =   email;
        data["type"] =    type;
        data["phone"] =   phone;
        data["image"] =   image;
        data["subject"] = subject;
        data["active"] =  active;
        data["code"] =    code;
        data["created_at"] = createdAt;
        data["updated_at"] = updatedAt;
        if(pivot != null){
            data["pivot"] = pivot?.toJson();
        }
        return data;
    }
}

class Pivot {
    int? courseId;
    int? teacherId;

    Pivot({this.courseId, this.teacherId});

    Pivot.fromJson(Map<String, dynamic> json) {
        courseId = json["course_id"];
        teacherId = json["teacher_id"];
    }

    Map<String, dynamic> toJson() {
        final data =<String, dynamic>{};
        data["course_id"] =  courseId;
        data["teacher_id"] = teacherId;
        return data;
    }
}