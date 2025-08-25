import 'package:terapis/global_resource.dart';

class SpesifikasiProduct extends StatelessWidget {
  final Produk? produk;
  const SpesifikasiProduct({Key? key, this.produk}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          spesifikasi(
            produk!.varianBarang![0].barang!.satuan!.satuan.toString(),
            produk!.varianBarang![0].barang!.kategori!.kategori.toString(),
            produk!.varianBarang![0].barang!.berat.toString(),
          );
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Spesifikasi', style: TextStyle(fontSize: 16)),
              Icon(Icons.arrow_forward_ios_outlined, size: 14),
            ],
          ),
        ),
      ),
    );
  }
}

void spesifikasi(String satuan, String kategori, String berat) {
  Get.bottomSheet(
    SizedBox(
      height: 250,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const Text('Spesifikasi', style: TextStyle(fontSize: 17)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Satuan',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 118, 118, 118),
                    ),
                  ),
                  Text(satuan, style: const TextStyle(fontSize: 14)),
                ],
              ),
              const SizedBox(height: 5),
              const Divider(color: Colors.black12),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Kategori',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 118, 118, 118),
                    ),
                  ),
                  Text(kategori, style: const TextStyle(fontSize: 14)),
                ],
              ),
              const SizedBox(height: 5),
              const Divider(color: Colors.black12),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Berat',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 118, 118, 118),
                    ),
                  ),
                  Text('$berat Gram', style: const TextStyle(fontSize: 14)),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
