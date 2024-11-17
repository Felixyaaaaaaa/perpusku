import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/contant/endpoint.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/routes/app_pages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/theme/colors.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find<ProfileController>();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: GoogleFonts.poppins(
              color: text_white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          backgroundColor: appbar,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: text_white,
            ),
            onPressed: () {
              Get.toNamed(Routes.HOME);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                Get.toNamed(Routes.EDIT_PROFILE);
              },
            ),
          ],
        ),
        backgroundColor: background,
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  child: Image.asset("assets/profile_background.jpg"),
                ),
                Positioned(
                  top: 50,
                  left: 1,
                  right: 1,
                  child: Column(
                    children: [
                      Obx(
                        () => CircleAvatar(
                          radius: 53,
                          backgroundImage: NetworkImage(
                              "${controller.image.value}"),
                          // foregroundImage: AssetImage("assets/profile.jpg"),
                        ),
                      ),
                      SizedBox(height: 8),
                      Obx(() => Text(
                            controller.username.value,
                            style: GoogleFonts.poppins(
                                color: text_white,
                                fontWeight: FontWeight.w800,
                                fontSize: 17),
                          )),
                      SizedBox(height: 2),
                      Text(
                        "PEMINJAM",
                        style: GoogleFonts.poppins(
                          color: text_white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(Iconsax.receipt, color: text_button),
              title: Text(
                "List Peminjaman",
                style: GoogleFonts.lato(
                  color: appbar,
                ),
              ),
              onTap: () {
                Get.toNamed(Routes.LIST_PEMINJAMAN);
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              // Sesuaikan dengan ukuran padding yang diinginkan
              child: Divider(
                thickness: 1.0, // Ubah ketebalan garis
                color: Colors.grey, // Ubah warna garis
              ),
            ),
            ListTile(
              leading: Icon(Iconsax.receipt_search, color: text_button),
              title: Text(
                "Riwayat Peminjaman",
                style: GoogleFonts.lato(
                  color: appbar,
                ),
              ),
              onTap: () {
                Get.toNamed(Routes.RIWAYAT_PEMINJAMAN);
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              // Sesuaikan dengan ukuran padding yang diinginkan
              child: Divider(
                thickness: 1.0, // Ubah ketebalan garis
                color: Colors.grey, // Ubah warna garis
              ),
            ),
            ListTile(
              leading: Icon(Iconsax.save_2, color: text_button),
              title: Text(
                "Koleksi",
                style: GoogleFonts.lato(
                  color: appbar,
                ),
              ),
              onTap: () {
                Get.toNamed(Routes.KOLEKSI);
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                thickness: 1.0, // Ubah ketebalan garis
                color: Colors.grey, // Ubah warna garis
              ),
            ),
            ListTile(
              leading: Icon(Iconsax.logout, color: text_button),
              title: Text(
                "Logout",
                style: GoogleFonts.lato(
                  color: appbar,
                ),
              ),
              onTap: () {
                _showLogoutConfirmationDialog(context);
              },
            ),
          ],
        ));
  }
}

void _showLogoutConfirmationDialog(BuildContext context) {
  final ProfileController controller = Get.find<ProfileController>();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Logout',
          style: GoogleFonts.poppins(
            color: text_bold,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: button_white,
        content: Text(
          'Apakah Anda yakin ingin logout?',
          style: GoogleFonts.poppins(
            color: card,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Tutup dialog
            },
            child: Text(
              'Batal',
              style: GoogleFonts.poppins(
                color: text_bold,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              // Lakukan logout jika pengguna mengkonfirmasi
              controller.logout();
              Navigator.of(context).pop(); // Tutup dialog
            },
            child: Text(
              'Logout',
              style: GoogleFonts.poppins(
                color: text_bold,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      );
    },
  );
}
