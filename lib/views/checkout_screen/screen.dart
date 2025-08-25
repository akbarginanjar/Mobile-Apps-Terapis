import 'package:terapis/global_resource.dart';
import 'package:terapis/services/checkout_service.dart';

class CheckoutScreen extends StatefulWidget {
  final VarianBarang? varian;
  const CheckoutScreen({super.key, required this.varian});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final CheckoutController checkoutController = CheckoutController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black38,
        elevation: 3,
        centerTitle: true,
        title: Text(
          'Checkout',
          style: GoogleFonts.montserrat(color: Colors.black),
        ),
        iconTheme: IconThemeData(
          color: primary, // Ubah warna ikon kembali di sini
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AlamatPengiriman(),
                KetProduk(varian: widget.varian),
                const KurirPengiriman(),
                const MetodePembayaran(),
                RincianPembayaran(varian: widget.varian),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 11.2,
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 4.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.grey[200]!, width: 1.5),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: GetBuilder<CheckoutController>(
                      init: CheckoutController(),
                      builder: (c) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.apply(color: Colors.grey[600]),
                            ),
                            Obx(
                              () => Text(
                                // ignore: unrelated_type_equality_checks
                                c.totalBayar == 0
                                    ? toCurrency(
                                        widget.varian!.harga! + 6000 + 1000,
                                      )
                                    : toCurrency(c.totalBayar.toInt()),
                                style: Theme.of(context).textTheme.titleSmall
                                    ?.apply(color: Colors.black87),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  GetBuilder<CheckoutController>(
                    init: CheckoutController(),
                    builder: (c) {
                      return Flexible(
                        flex: 2,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          onPressed: () {
                            if (c.selectBank == null) {
                              EasyLoading.showToast('Pilih Alamat Pengiriman');
                            } else if (c.selectKurir == null) {
                              EasyLoading.showToast('Pilih Opsi Pengiriman');
                            } else if (c.selectAlamat == null) {
                              EasyLoading.showToast('Pilih Metode Pembayaran');
                            } else {
                              int totalBayarApi;
                              if (c.totalBayarCheckout.toInt() == 0) {
                                totalBayarApi = widget.varian!.harga! + 1000;
                              } else {
                                totalBayarApi = c.totalBayarCheckout.toInt();
                              }

                              CheckoutServiceController().checkout(
                                memberId: GetStorage().read('member_id'),
                                nama: GetStorage()
                                    .read('nama_lengkap')
                                    .toString(),
                                email: GetStorage().read('email').toString(),
                                noHp: GetStorage().read('no_hp').toString(),
                                totalBayar: totalBayarApi,
                                ongkir: 6000,
                                penyimpananId: widget.varian!.id!,
                                qty: c.quantity.toInt(),
                                hargaSatuan: widget.varian!.harga!,
                                idProvinsi: c.idProvinsi!,
                                idKabKot: c.idKabKot!,
                                idKecamatan: c.idKecamatan!,
                                idKelurahan: c.idKelurahan!,
                                alamat: c.alamat!,
                                code: c.selectBank!,
                              );
                            }
                          },
                          child: Text(
                            'Buat Pesan',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge!.apply(color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
