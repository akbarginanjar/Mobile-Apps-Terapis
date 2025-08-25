import 'dart:io';

import 'package:terapis/global_resource.dart';
import 'package:terapis/models/checkout_model.dart';
import 'package:terapis/views/pembayaran/screen.dart';

class CheckoutServiceController extends GetConnect {
  var tokens = GetStorage().read('tokens');
  Future<Checkout> checkout({
    required int memberId,
    required String nama,
    required String email,
    required String noHp,
    required int totalBayar,
    required int ongkir,
    required int penyimpananId,
    required int qty,
    required int hargaSatuan,
    required int idProvinsi,
    required int idKabKot,
    required int idKecamatan,
    required int idKelurahan,
    required String alamat,
    required int code,
  }) async {
    try {
      var body = {
        "nama": nama,
        "email": email,
        "no_hp": noHp,
        "transfer": totalBayar, // menggantikan prop uang_masuk
        "ongkir": ongkir,
        "metode_bayar":
            "manual_transfer", // manual_transfer || payment_gateway (kalo pake FLIP)
        "pengiriman_id": 1, // diambil dari id api list jasa pengiriman
        "item": [
          {
            "penyimpanan_id": penyimpananId,
            "qty": qty,
            "harga_satuan": hargaSatuan,
          },
        ],
        "provinsi": idProvinsi,
        "kab_kota": idKabKot,
        "kecamatan": idKecamatan,
        "desa": idKelurahan,
        "alamat_pengiriman": alamat,
        "kode_bayar": code,
      };

      // loadingPage();
      EasyLoading.show(status: 'Pesanan Diproses...');

      final Response conn = await post(
        '${Base.url}/v1/checkout',
        body,
        headers: {
          'secret':
              'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
          'Author': 'bearer $tokens',
          'device': 'mobile',
        },
      );
      if (conn.statusCode == 200) {
        EasyLoading.showSuccess('Pesanan berhasil dibuat');
        Get.offAll(KonfirmasiPembayaranScreen(idTransaksi: conn.body['id']));
        // return User.fromJson(conn.body);
      } else if (conn.statusCode == null) {
        EasyLoading.showInfo('Perbaiki Koneksi Internet');
      } else {
        EasyLoading.showInfo('${conn.body}');
      }
    } on TimeoutException {
      Get.snackbar(
        'Masalah Koneksi',
        'Jaringan lemah\nsilahkan perbaiki jaringan anda!',
      );
    } on SocketException {
      Get.snackbar(
        'Masalah Koneksi',
        'Data dalam keadaan mati\nsilahkan nyalakan data anda!',
      );
    } on HttpException catch (e) {
      Get.snackbar('Masalah Koneksi', e.message);
    } on Error catch (e) {
      Get.snackbar(e.toString(), e.stackTrace.toString());
    }
    return Checkout();
  }
}
