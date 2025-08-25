import 'package:terapis/global_resource.dart';
import 'package:terapis/models/alamat_model.dart';

class AlamatController extends GetxController {
  var provinces = <Province>[].obs;
  var kabkots = <KabKot>[].obs;
  var kecamatans = <Kacamatan>[].obs;
  var kelurahans = <KelurahanModel>[].obs;
  int? selectProvinsi;
  int? selectKabKot;
  int? selectKecamatan;
  int? selectKelurahan;
  var selectedJenisALamat = 'Pilih Jenis Alamat'.obs;

  void changeJenisAlamat(String newOption) {
    selectedJenisALamat.value = newOption;
  }

  void changeSelectProvinsi(int value) {
    selectProvinsi = value;
    fetchKabKot(selectProvinsi);
    update();
  }

  void changeSelectKabKot(int value) {
    selectKabKot = value;
    fetchKecamatan(selectKabKot);
    update();
  }

  void changeSelectKecamatan(int value) {
    selectKecamatan = value;
    fetchKelurahan(selectKecamatan);
    update();
  }

  void changeSelectKelurahan(int value) {
    selectKelurahan = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchProvinces();
  }

  Future<List<Province>> fetchProvinces() async {
    var response = await GetConnect().get(
      '${Base.url}/v1/wilayah/provinsi',
      headers: {
        'secret':
            'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
        // 'Author': 'bearer $tokens',
        'device': 'mobile',
      },
    );
    if (response.statusCode == 200) {
      var jsonList = response.body['data'] as List;
      List<Province> provinceList = jsonList
          .map((json) => Province.fromJson(json))
          .toList();
      provinces.value = provinceList;
    } else {
      // Handle error
    }
    return [];
  }

  Future<List<KabKot>> fetchKabKot(int? idProvinsi) async {
    var response = await GetConnect().get(
      '${Base.url}/v1/wilayah/kab-kota?id_provinsi=$idProvinsi',
      headers: {
        'secret':
            'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
        // 'Author': 'bearer $tokens',
        'device': 'mobile',
      },
    );
    if (response.statusCode == 200) {
      var jsonList = response.body['data'] as List;
      List<KabKot> kabkotList = jsonList
          .map((json) => KabKot.fromJson(json))
          .toList();
      kabkots.value = kabkotList;
    } else {
      // Handle error
    }
    return [];
  }

  Future<List<Kacamatan>> fetchKecamatan(int? idKabKot) async {
    var response = await GetConnect().get(
      '${Base.url}/v1/wilayah/kecamatan?id_kab_kota=$idKabKot',
      headers: {
        'secret':
            'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
        // 'Author': 'bearer $tokens',
        'device': 'mobile',
      },
    );
    if (response.statusCode == 200) {
      var jsonList = response.body['data'] as List;
      List<Kacamatan> kecamatanList = jsonList
          .map((json) => Kacamatan.fromJson(json))
          .toList();
      kecamatans.value = kecamatanList;
    } else {
      // Handle error
    }
    return [];
  }

  Future<List<KelurahanModel>> fetchKelurahan(int? idKecamatan) async {
    var response = await GetConnect().get(
      '${Base.url}/v1/wilayah/kelurahan?id_kecamatan=$idKecamatan',
      headers: {
        'secret':
            'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
        // 'Author': 'bearer $tokens',
        'device': 'mobile',
      },
    );
    if (response.statusCode == 200) {
      var jsonList = response.body['data'] as List;
      List<KelurahanModel> kelurahanList = jsonList
          .map((json) => KelurahanModel.fromJson(json))
          .toList();
      kelurahans.value = kelurahanList;
    } else {
      // Handle error
    }
    return [];
  }

  Future<Alamat> createAlamat({
    required String labelAlamat,
    required int idProvinsi,
    required int idKabKot,
    required int idKecamatan,
    required int idKelurahan,
    required String detailAlamat,
    required String nomorHp,
    required String namaLengkap,
    required String jenisAlamat,
    required String catatan,
    required String lat,
    required String long,
  }) async {
    var body = {
      "member_id": GetStorage().read('member_id'),
      "label_alamat": labelAlamat, // OPTIONAL
      "provinsi_id": idProvinsi,
      "kab_kota_id": idKabKot,
      "kecamatan_id": idKecamatan,
      "desa_id": idKelurahan, // OPTIONAL
      "alamat": detailAlamat,
      "nomor_kontak": nomorHp,
      "nama_kontak": namaLengkap,
      "jenis_alamat": 'utama', // PILIHAN "utama" "toko" "retur"
      "catatan": catatan, // OPTIONAL
      "latitude": lat,
      "longitude": long,
    };

    EasyLoading.show(status: 'Loading...');

    final Response conn = await GetConnect().post(
      '${Base.url}/v1/member/input-alamat',
      body,
      headers: {
        'secret':
            'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
        'Author': 'bearer ${GetStorage().read('tokens')}',
        'device': 'mobile',
      },
    );
    if (conn.statusCode == 200) {
      EasyLoading.showSuccess('Alamat Tersimpan');
      Get.back();
    } else if (conn.statusCode == null) {
      EasyLoading.showInfo('Perbaiki Koneksi Internet');
    } else if (conn.statusCode == 400) {
      EasyLoading.showError(conn.body['message']);
    }
    return Alamat();
  }
}
