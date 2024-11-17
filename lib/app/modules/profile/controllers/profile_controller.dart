import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/contant/endpoint.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/provider/api_provider.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/provider/storage_provider.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  var username = ''.obs;
  var image = ''.obs;
  final count = 0.obs;

  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    profile();
    image.value = "${Endpoint.baseUrlApi}${StorageProvider.read(StorageKey.image_profile)}";
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // ProfileController() {
  //   profile();
    // Future<String> profile() async {
    //   // Panggil metode get dari ApiProvider untuk melakukan panggilan API
    //   final response = await ApiProvider.instance().get(Endpoint.login,
    //       data: {
    //     'username': usernameController.text.toString(),
    //       }
    //   );
    //   // Periksa apakah respons memiliki status code 200 (OK)
    //   if (response.statusCode == 200) {
    //     // Jika panggilan berhasil, dekode respons JSON
    //     Map<String, dynamic> profileData = jsonDecode(response.data);
    //     // Kembalikan nama profil dari data yang diterima
    //     return profileData['username'];
    //   } else {
    //     // Jika panggilan gagal, lempar exception
    //     throw Exception('Failed to load profile data');
    //   }
    // }
  // }

  profile() async {
    username.value = StorageProvider.read(StorageKey.username);
    image.value = "${StorageProvider.read(StorageKey.image_profile)}";
    final response = await ApiProvider.instance().get(Endpoint.login, data: {
      'username': usernameController.text.toString(),
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> profileData = jsonDecode(response.data);
      return profileData['username'];
    } else {
      throw Exception('Failed to load profile data');
    }
  }

  logout() async {
    loading(true);
    await StorageProvider.delete(StorageKey.status);
    await StorageProvider.delete(StorageKey.idUser);
    Get.offAllNamed(Routes.LOGIN);
  }
}
