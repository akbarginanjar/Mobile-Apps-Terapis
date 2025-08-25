import 'package:terapis/global_resource.dart';
import 'package:terapis/views/checkout_screen/voucher.dart';

class KetProduk extends StatelessWidget {
  final VarianBarang? varian;
  const KetProduk({super.key, required this.varian});
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> form = GlobalKey<FormState>();
    final TextEditingController pesan = TextEditingController();
    // final TextEditingController qtt = TextEditingController(text: '1');

    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.storefront_sharp,
                size: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 6.0),
              Text(
                varian!.gudang!.namaGudang!,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.apply(color: Colors.black87),
              ),
            ],
          ),
          Card(
            color: Colors.grey[100],
            surfaceTintColor: Colors.grey[100],
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        varian!.barang!.photo!.isEmpty
                            ? 'https://removal.ai/wp-content/uploads/2021/02/no-img.png'
                            : varian!.barang!.photo![0].path!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${varian!.barang!.nama} - ${varian!.barang!.varian}',
                          softWrap: true,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.montserrat(fontSize: 13),
                        ),
                        Text(
                          'Variasi : ${varian!.barang!.varian}',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.apply(color: Colors.grey[500]),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          toCurrency(varian!.harga!),
                          style: Theme.of(context).textTheme.bodyLarge?.apply(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 3.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Kuantitas', style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(
                height: 40,
                child: Card(
                  elevation: 0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.black26, width: 1.5),
                  ),
                  child: GetBuilder<CheckoutController>(
                    init: CheckoutController(),
                    builder: (c) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(Icons.remove),
                            iconSize: 18,
                            onPressed: () {
                              c.decrement(varian!.harga!);
                            },
                          ),
                          Obx(
                            () => Text(
                              '${c.quantity}',
                              style: TextStyle(fontSize: 15, color: primary),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            iconSize: 18,
                            onPressed: () {
                              c.increment(varian!.harga!);
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 3.0),
          Form(
            key: form,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Catatan',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          maxLength: 200,
                          autofocus: false,
                          minLines: null,
                          decoration: InputDecoration(
                            hintText: 'Masukan catatan disini...',
                            hintStyle: GoogleFonts.montserrat(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                            fillColor: primary,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1.5,
                                color: primary,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 0.9,
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          keyboardType: TextInputType.multiline,
                          controller: pesan,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Divider(color: Colors.grey[200]),
          const SizedBox(height: 2),
          const Voucher(),
        ],
      ),
    );
  }
}
