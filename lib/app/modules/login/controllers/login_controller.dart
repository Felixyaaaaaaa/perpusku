import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_login.dart';

import '../../../data/contant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    String status = StorageProvider.read(StorageKey.status);
    String role = StorageProvider.read(StorageKey.role);
    if (status == 'logged') {
      // Jika sudah login, arahkan ke halaman beranda sesuai dengan peran pengguna
      if (role == 'PEMINJAM') {
        Get.offAllNamed(Routes.HOME);
      } else if (role == 'PETUGAS') {
        Get.offAllNamed(Routes.HOME_PETUGAS);
      } else {
        // Handle other roles or scenarios here
        Get.snackbar('Sorry', 'Role not supported', backgroundColor: Colors.orange);
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  login() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.login,
            data: {
              'username': usernameController.text.toString(),
              'password': passwordController.text.toString()
            });
        if (response.statusCode == 200) {
          final ResponseLogin responseLogin = ResponseLogin.fromJson(response.data);
          await StorageProvider.write(StorageKey.status, 'logged');
          await StorageProvider.write(StorageKey.role, responseLogin.user!.role.toString()); // Simpan peran pengguna
          await StorageProvider.write(StorageKey.idUser, responseLogin.user!.id.toString());
          await StorageProvider.write(StorageKey.username, responseLogin.user!.username.toString());
          await StorageProvider.write(StorageKey.image_profile, responseLogin.user!.image.toString());

          // Check the role and navigate accordingly
          if (responseLogin.user!.role == 'PEMINJAM') {
            Get.offAllNamed(Routes.HOME);
          } else if (responseLogin.user!.role == 'PETUGAS') {
            Get.offAllNamed(Routes.HOME_PETUGAS);
          } else {
            // Handle other roles or scenarios here
            Get.snackbar('Sorry', 'Role not supported', backgroundColor: Colors.orange);
          }
        } else {
          Get.snackbar('Sorry', 'Login Gagal', backgroundColor: Colors.orange);
        }
      }
    } on dio.DioError catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response!.data != null) {
          Get.snackbar('Sorry', '${e.response!.data['message']}', backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar('Sorry', e.message ?? '', backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar('Error', e.toString(), backgroundColor: Colors.red);
    } finally {
      loading(false);
    }
  }



}