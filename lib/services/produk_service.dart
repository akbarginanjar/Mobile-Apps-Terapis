import 'dart:io';

import 'package:terapis/global_resource.dart';

class ProdukController extends GetConnect {
  Future<List<Produk>> getProduk() async {
    try {
      final String tokens = GetStorage().read('tokens');
      if (GetStorage().read('id_toko') == null) {
        final conn = await get(
          '${Base.url}/v1/toko-penyimpanan?start=0&length=8&order=desc&harga=retail&show_as_product=1',
          headers: {
            'secret':
                'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
            'Authorization': 'bearer $tokens',
            'device': 'mobile',
            'Author': 'bearer $tokens',
          },
        );

        if (conn.statusCode == 200) {
          final List result = conn.body['data'];
          return result.map((e) => Produk.fromJson(e)).toList();
        } else if (conn.statusCode == 401) {
          Get.offAll(const LoginScreen());
          Get.snackbar('Masa Aktif Akun Habis', 'Silahkan login kembali');
        } else if (conn.statusCode == null) {
          noInternet();
        }
      } else {
        final connGudang = await get(
          '${Base.url}/v1/gudang-public?member_id=${GetStorage().read('id_toko')}&start=0&length=10',
          headers: {
            'secret':
                'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
            'Authorization': 'bearer $tokens',
            'device': 'mobile',
            'Author': 'bearer $tokens',
          },
        );
        if (connGudang.statusCode == 200) {
          final List resultGudang = connGudang.body['data'];
          final conn = await get(
            '${Base.url}/v1/toko-penyimpanan?gudang_id=${resultGudang[0]['id']}&harga=retail&show_as_product=1',
            headers: {
              'secret':
                  'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
              'Authorization': 'bearer $tokens',
              'device': 'mobile',
              'Author': 'bearer $tokens',
            },
          );
          if (conn.statusCode == 200) {
            final List result = conn.body['data'];
            print(result);
            return result.map((e) => Produk.fromJson(e)).toList();
          } else if (conn.statusCode == 401) {
            Get.offAll(const LoginScreen());
            Get.snackbar('Masa Aktif Akun Habis', 'Silahkan login kembali');
          } else if (conn.statusCode == null) {
            Get.snackbar('Error', 'Koneksi internet');
            // Get.to(const Koneksi(), transition: Transition.downToUp);
          }
        } else if (connGudang.statusCode == 401) {
          Get.offAll(const LoginScreen());
          Get.snackbar('Masa Aktif Akun Habis', 'Silahkan login kembali');
        } else if (connGudang.statusCode == null) {
          noInternet();
        }
        // Get.snackbar('Terjadi Masalah', conn.body['message']);
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

    return [];
  }

  Future<List<Produk>> searchProduk(String search) async {
    try {
      final String tokens = GetStorage().read('tokens');
      final conn = await get(
        '${Base.url}/v1/toko-penyimpanan-public?search=$search&harga=retail&show_as_product=1',
        headers: {
          'secret':
              'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
          'Authorization': 'bearer $tokens',
          'device': 'mobile',
          'Author': 'bearer $tokens',
        },
      );
      if (conn.statusCode == 200) {
        final List result = conn.body['data'];

        return result.map((e) => Produk.fromJson(e)).toList();
      } else if (conn.statusCode == 401) {
        Get.offAll(const LoginScreen());
        Get.snackbar('Masa Aktif Akun Habis', 'Silahkan login kembali');
      } else if (conn.statusCode == null) {
        noInternet();
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

    return [];
  }
}
