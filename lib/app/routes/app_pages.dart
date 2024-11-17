import 'package:get/get.dart';

import '../modules/add_buku/bindings/add_buku_binding.dart';
import '../modules/add_buku/views/add_buku_view.dart';
import '../modules/add_peminjaman/bindings/add_peminjaman_binding.dart';
import '../modules/add_peminjaman/views/add_peminjaman_view.dart';
import '../modules/book/bindings/book_binding.dart';
import '../modules/book/views/book_view.dart';
import '../modules/edit_buku/bindings/edit_buku_binding.dart';
import '../modules/edit_buku/views/edit_buku_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_petugas/bindings/home_petugas_binding.dart';
import '../modules/home_petugas/views/home_petugas_view.dart';
import '../modules/koleksi/bindings/koleksi_binding.dart';
import '../modules/koleksi/bindings/koleksi_binding.dart';
import '../modules/koleksi/views/koleksi_view.dart';
import '../modules/koleksi/views/koleksi_view.dart';
import '../modules/list_peminjaman/bindings/list_peminjaman_binding.dart';
import '../modules/list_peminjaman/views/list_peminjaman_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/peminjaman/bindings/peminjaman_binding.dart';
import '../modules/peminjaman/views/peminjaman_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/return_book/bindings/return_book_binding.dart';
import '../modules/return_book/views/return_book_view.dart';
import '../modules/riwayat_peminjaman/bindings/riwayat_peminjaman_binding.dart';
import '../modules/riwayat_peminjaman/views/riwayat_peminjaman_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.BOOK,
      page: () => const BookView(),
      binding: BookBinding(),
    ),
    GetPage(
      name: _Paths.PEMINJAMAN,
      page: () => const PeminjamanView(),
      binding: PeminjamanBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PEMINJAMAN,
      page: () => const AddPeminjamanView(),
      binding: AddPeminjamanBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.KOLEKSI,
      page: () => const KoleksiView(),
      binding: KoleksiBinding(),
      children: [
        GetPage(
          name: _Paths.KOLEKSI,
          page: () => const KoleksiView(),
          binding: KoleksiBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.LIST_PEMINJAMAN,
      page: () => const ListPeminjamanView(),
      binding: ListPeminjamanBinding(),
    ),
    GetPage(
      name: _Paths.RIWAYAT_PEMINJAMAN,
      page: () => const RiwayatPeminjamanView(),
      binding: RiwayatPeminjamanBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.HOME_PETUGAS,
      page: () => const HomePetugasView(),
      binding: HomePetugasBinding(),
    ),
    GetPage(
      name: _Paths.RETURN_BOOK,
      page: () => const ReturnBookView(),
      binding: ReturnBookBinding(),
    ),
    GetPage(
      name: _Paths.ADD_BUKU,
      page: () => const AddBukuView(),
      binding: AddBukuBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_BUKU,
      page: () => const EditBukuView(),
      binding: EditBukuBinding(),
    ),
  ];
}
