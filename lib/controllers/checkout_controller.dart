import 'package:terapis/global_resource.dart';

class CheckoutController extends GetxController {
  RxInt quantity = 1.obs;
  int subtotalPengiriman = 6000;
  int biayaLayanan = 1000;
  int? harga;
  RxInt totalHarga = 0.obs;
  RxInt totalBayar = 0.obs;
  RxInt totalBayarCheckout = 0.obs;

  int? selectBank;
  String? judul;
  String? metode;
  String? noRekening;

  int? selectAlamat;
  int? idProvinsi;
  int? idKabKot;
  int? idKecamatan;
  int? idKelurahan;
  String? namaKontak;
  String? nomorKontak;
  String? alamat;
  String? labelAlamat;

  int? selectKurir;
  String? namePengirimanKurir;
  String? nameKurir;
  int? priceKurir;
  int? minDayKurir;
  int? maxDayKurir;

  final List<Map> listKurir = [
    {
      'name_pengiriman': 'JNE',
      'name': 'Reguler',
      'price': 12000,
      'minDay': 3,
      'maxDay': 6,
    },
    {
      'name_pengiriman': 'JNT',
      'name': 'Ngegas',
      'price': 16000,
      'minDay': 2,
      'maxDay': 4,
    },
    {
      'name_pengiriman': 'JNE',
      'name': 'Ngegas Gila',
      'price': 25000,
      'minDay': 1,
      'maxDay': 2,
    },
  ];

  void changeSelectKurir(
    int value,
    String namePengiriman,
    String name,
    int price,
    int minDay,
    int maxDay,
  ) {
    selectKurir = value;
    namePengirimanKurir = namePengiriman;
    nameKurir = name;
    priceKurir = price;
    minDayKurir = minDay;
    maxDayKurir = maxDay;
    update();
  }

  void changeSelectAlamat(
    int value,
    String nama,
    String nomor,
    String detailAlamat,
    String label,
    int provinsi,
    int kabkot,
    int kecamatan,
    int kelurahan,
  ) {
    selectAlamat = value;
    namaKontak = nama;
    nomorKontak = nomor;
    alamat = detailAlamat;
    labelAlamat = label;
    idProvinsi = provinsi;
    idKabKot = kabkot;
    idKecamatan = kecamatan;
    idKelurahan = kelurahan;
    update();
    Get.back();
  }

  void changeSelectBank(
    int value,
    String metodePembayaran,
    String tujuan,
    String number,
  ) {
    selectBank = value;
    judul = metodePembayaran;
    metode = tujuan;
    noRekening = number;
    update();
  }

  @override
  void onInit() async {
    // inisialState();
    super.onInit();
  }

  void increment(int harga) {
    quantity.value++;
    totalHarga.value = harga * quantity.value;
    totalBayar.value = totalHarga.value + subtotalPengiriman + biayaLayanan;
    totalBayarCheckout.value = totalHarga.value + biayaLayanan;
  }

  void decrement(int harga) {
    if (quantity.value > 1) {
      quantity.value--;
      totalHarga.value = harga * quantity.value;
      totalBayar.value = totalHarga.value + subtotalPengiriman + biayaLayanan;
      totalBayarCheckout.value = totalHarga.value + biayaLayanan;
    }
  }
}
