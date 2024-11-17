/// Statuscode : 200
/// message : "SUCCES "
/// data : [{"kategorybuku_id":1,"nama_kategory":"Comic"}]

class ResponseKategorybuku {
  ResponseKategorybuku({
      this.statuscode, 
      this.message, 
      this.data,});

  ResponseKategorybuku.fromJson(dynamic json) {
    statuscode = json['Statuscode'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataKategoryBuku.fromJson(v));
      });
    }
  }
  int? statuscode;
  String? message;
  List<DataKategoryBuku>? data;

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

/// kategorybuku_id : 1
/// nama_kategory : "Comic"

class DataKategoryBuku {
  DataKategoryBuku({
      this.kategorybukuId, 
      this.namaKategory,});

  DataKategoryBuku.fromJson(dynamic json) {
    kategorybukuId = json['kategorybuku_id'];
    namaKategory = json['nama_kategory'];
  }
  int? kategorybukuId;
  String? namaKategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kategorybuku_id'] = kategorybukuId;
    map['nama_kategory'] = namaKategory;
    return map;
  }

}