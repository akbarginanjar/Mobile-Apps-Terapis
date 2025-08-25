// ignore_for_file: unnecessary_null_comparison, prefer_if_null_operators

import 'package:terapis/global_resource.dart';

class DeskripsiProduct extends StatelessWidget {
  final Produk? produk;
  const DeskripsiProduct({super.key, this.produk});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 2000),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(color: Colors.grey[200], thickness: 1),
          Text(
            'Deskripsi Produk',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.apply(color: Colors.black87),
          ),
          const SizedBox(height: 5),
          Text(
            produk!.varianBarang![0].barang!.deskripsi == null
                ? '-'
                : produk!.varianBarang![0].barang!.deskripsi.toString(),
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.apply(color: Colors.black54),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
