/// Statuscode : 200
/// message : "SUCCESS"
/// data : [{"id":18,"user_id":1,"buku_id":16,"peminjaman_id":28,"rating":4,"ulasan":"buku nya keren","createdAt":"23-04-2024","updatedAt":"23-04-2024","DataPinjamUser":{"username":"david","image":"http://192.168.1.7:3000/image/image-1713890584720-230820317.jpg"}}]

class ResponseUlasan {
  ResponseUlasan({
      this.statuscode, 
      this.message, 
      this.data,});

  ResponseUlasan.fromJson(dynamic json) {
    statuscode = json['Statuscode'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataUlasan.fromJson(v));
      });
    }
  }
  int? statuscode;
  String? message;
  List<DataUlasan>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Statuscode'] = statuscode;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 18
/// user_id : 1
/// buku_id : 16
/// peminjaman_id : 28
/// rating : 4
/// ulasan : "buku nya keren"
/// createdAt : "23-04-2024"
/// updatedAt : "23-04-2024"
/// DataPinjamUser : {"username":"david","image":"http://192.168.1.7:3000/image/image-1713890584720-230820317.jpg"}

class DataUlasan {
  DataUlasan({
      this.id, 
      this.userId, 
      this.bukuId, 
      this.peminjamanId, 
      this.rating, 
      this.ulasan, 
      this.createdAt, 
      this.updatedAt, 
      this.dataPinjamUser,});

  DataUlasan.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    bukuId = json['buku_id'];
    peminjamanId = json['peminjaman_id'];
    rating = json['rating'];
    ulasan = json['ulasan'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    dataPinjamUser = json['DataPinjamUser'] != null ? DataPinjamUser.fromJson(json['DataPinjamUser']) : null;
  }
  int? id;
  int? userId;
  String? bukuId;
  int? peminjamanId;
  int? rating;
  String? ulasan;
  String? createdAt;
  String? updatedAt;
  DataPinjamUser? dataPinjamUser;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['buku_id'] = bukuId;
    map['peminjaman_id'] = peminjamanId;
    map['rating'] = rating;
    map['ulasan'] = ulasan;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    if (dataPinjamUser != null) {
      map['DataPinjamUser'] = dataPinjamUser?.toJson();
    }
    return map;
  }

}

/// username : "david"
/// image : "http://192.168.1.7:3000/image/image-1713890584720-230820317.jpg"

class DataPinjamUser {
  DataPinjamUser({
      this.username, 
      this.image,});

  DataPinjamUser.fromJson(dynamic json) {
    username = json['username'];
    image = json['image'];
  }
  String? username;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['image'] = image;
    return map;
  }

}