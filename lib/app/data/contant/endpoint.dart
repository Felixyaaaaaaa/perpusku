
class Endpoint {
  static const String baseUrlApi = "http://192.168.1.8:3000";
  // static const String baseUrlApi = "http://192.168.1.8:3000";
  // static const String baseUrlApi = "http://192.168.137.51:3000";
  // static const String baseUrlApi = "http://192.168.10.104:3000/";

  static const String login = "${baseUrlApi}/login";
  static const String update_user = "${baseUrlApi}/update_user";
  static const String user = "${baseUrlApi}/user";
  static const String register = "${baseUrlApi}/register";
  static const String book = "${baseUrlApi}/buku";
  static const String recommended = "${baseUrlApi}/rekomendasi-buku";
  static const String terbaru = "${baseUrlApi}/terbaru-buku";
  static const String rating = "${baseUrlApi}/rating-buku";
  static const String pinjam = "${baseUrlApi}/pinjam";
  static const String kembali = "${baseUrlApi}/kembalikan";
  static const String riwayat = "${baseUrlApi}/riwayat";
  static const String koleksi = "${baseUrlApi}/koleksi";
  static const String ulasan = "${baseUrlApi}/ulasan";
  static const String kategory = "${baseUrlApi}/kategori_buku";
}
