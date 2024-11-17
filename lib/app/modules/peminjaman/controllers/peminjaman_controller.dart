import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_ulasan.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/provider/storage_provider.dart';

import '../../../data/contant/endpoint.dart';
import '../../../data/model/response_book.dart';
import '../../../data/provider/api_provider.dart';

class PeminjamanController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // final TextEditingController user_idController = TextEditingController();
  // final TextEditingController book_idController = TextEditingController();
  // final TextEditingController tanggal_pinjamController = TextEditingController();
  // final TextEditingController tanggal_kembaliController = TextEditingController();
  // final loading = false.obs;

  // final count = 0.obs;
  var rekomendasiBookList = <DataBook>[].obs;
  var ulasanList = <DataUlasan>[].obs;

  final loading = false.obs;

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
    getData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // getDetailBuku() async {
  //   change(null, status: RxStatus.loading());
  //   try {
  //     final response = await ApiProvider.instance().get(Endpoint.book);
  //     if (response.statusCode == 200) {
  //       final ResponseBook responseBook = ResponseBook.fromJson(response.data);
  //       if(responseBook.data!.isEmpty){
  //         change(null, status: RxStatus.empty());
  //       } else {
  //         change(responseBook.data, status: RxStatus.success());
  //       }
  //     } else {
  //       change(null, status: RxStatus.error('Gagal mengambil data'));
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       if (e.response?.data != null) {
  //         change(null, status: RxStatus.error(" dio ${e.response?.data['message']}"));
  //       }
  //     } else {
  //       change(null, status: RxStatus.error('cek' + (e.message ?? '')));
  //     }
  //   } catch (e) {
  //     change(null, status: RxStatus.error('catch'+e.toString()));
  //   }
  // }
  // getUlasan() async {
  //   change(null, status: RxStatus.loading());
  //   try {
  //     final response = await ApiProvider.instance().get(Endpoint.ulasan);
  //     if (response.statusCode == 200) {
  //       final Peminjaman responseUlasan = Peminjaman.fromJson(response.data);
  //       if(responseUlasan.data!.isEmpty){
  //         change(null, status: RxStatus.empty());
  //       } else {
  //         change(responseUlasan.data, status: RxStatus.success());
  //       }
  //     } else {
  //       change(null, status: RxStatus.error('Gagal mengambil data'));
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       if (e.response?.data != null) {
  //         change(null, status: RxStatus.error(" dio ${e.response?.data['message']}"));
  //       }
  //     } else {
  //       change(null, status: RxStatus.error('cek' + (e.message ?? '')));
  //     }
  //   } catch (e) {
  //     change(null, status: RxStatus.error('catch'+e.toString()));
  //   }
  // }

  Future<void> getData() async {
    loading(true);
    try {

      final responseRekomendasi = await ApiProvider.instance().get(Endpoint.recommended);
      final responseUlasan = await ApiProvider.instance().get("${Endpoint.ulasan}/${Get.parameters['id'].toString()}");

      if (responseRekomendasi.statusCode == 200 && responseUlasan.statusCode == 200) {

        // await getData();

        final List<DataBook> booksRekomendasi = (responseRekomendasi.data[0]['data'] as List)
            .map((json) => DataBook.fromJson(json))
            .toList();
        final List<DataUlasan> ulasan = (responseUlasan.data[0]['data'] as List)
            .map((json) => DataUlasan.fromJson(json))
            .toList();

        rekomendasiBookList.assignAll(booksRekomendasi);
        ulasanList.assignAll(ulasan);

      } else {
        Get.snackbar("Sorry", "Gagal Memuat Buku", backgroundColor: Colors.orange);
      }
      loading(false);
    } catch (e) {
      loading(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }

  bool bukuTerkoleksi = false;

  Future<void> cekKoleksi() async {
    try {
      final response = await ApiProvider.instance().get("${Endpoint.koleksi}/${StorageProvider.read(StorageKey.idUser)}/${Get.parameters['id']}");
      if (response.statusCode == 200) {
        // Buku sudah terkoleksi
        bukuTerkoleksi = true;
      } else {
        // Buku belum terkoleksi
        bukuTerkoleksi = false;
      }
    } catch (e) {
      // Tangani error jika gagal memeriksa koleksi
      print("Error cek koleksi: $e");
    }
  }

  addKoleksi() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post("${Endpoint.koleksi}",
            data: {
              "user_id": int.parse(StorageProvider.read(StorageKey.idUser)),
              "buku_id":  int.parse(Get.parameters['id'].toString()),
            });
        if (response.statusCode == 200) {
          // Setelah koleksi berhasil ditambahkan, perbarui status bukuTerkoleksi dan tampilkan snackbar sukses
          bukuTerkoleksi = true;
          Get.snackbar("Success", "Tambah Pinjam Berhasil", backgroundColor: Colors.green);
        } else {
          // Tampilkan snackbar gagal jika gagal menambahkan koleksi
          Get.snackbar("Sorry", "Tambah Pinjam Gagal", backgroundColor: Colors.orange);
        }
      }
      loading(false);
    } on DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}",
              backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
      print("Error, ${e.toString()}");
    }
  }

  hapusKoleksi() async {
    loading(true);
    try {
      final response = await ApiProvider.instance().delete("${Endpoint.koleksi}/${StorageProvider.read(StorageKey.idUser)}/${Get.parameters['id']}");
      if (response.statusCode == 200) {
        // Setelah koleksi berhasil dihapus, perbarui status bukuTerkoleksi dan tampilkan snackbar sukses
        bukuTerkoleksi = false;
        Get.snackbar("Success", "Koleksi berhasil dihapus", backgroundColor: Colors.green);
      } else {
        // Tampilkan snackbar gagal jika gagal menghapus koleksi
        Get.snackbar("Sorry", "Hapus Koleksi Gagal", backgroundColor: Colors.orange);
      }
    } on DioException catch (e) {
      // Tangani error dari Dio
      if (e.response != null && e.response?.data != null) {
        Get.snackbar("Sorry", "${e.response?.data['message']}", backgroundColor: Colors.orange);
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      // Tangani error umum
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
      print("Error, ${e.toString()}");
    } finally {
      loading(false);
    }
  }
}