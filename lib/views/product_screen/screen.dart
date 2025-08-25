import 'package:terapis/controllers/varian_controller.dart';
import 'package:terapis/global_resource.dart';
import 'package:terapis/views/product_screen/spesifikasi_product.dart';

class ProductScreen extends StatefulWidget {
  final Produk produk;
  const ProductScreen({super.key, required this.produk});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    List<VarianBarang> filterId = widget.produk.varianBarang!
        .where((item) => item.barang!.id == widget.produk.id)
        .toList();
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.grey[200],
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            shadowColor: Colors.black38,
            elevation: 10,
            title: Text(
              'Detail Produk',
              style: GoogleFonts.montserrat(color: Colors.black),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {},
              ),
              const SizedBox(width: 15),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GetBuilder<VarianController>(
                  init: VarianController(),
                  builder: (c) {
                    return Column(
                      children: [
                        const SizedBox(height: 50),
                        if (c.select != null)
                          Image.network(
                            '${widget.produk.varianBarang![c.select!].barang!.photo![0].path}',
                            height: 350,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          )
                        else
                          widget.produk.photo![0].path == null
                              ? Image.network(
                                  'https://removal.ai/wp-content/uploads/2021/02/no-img.png',
                                  height: 350,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  '${widget.produk.photo![0].path}',
                                  height: 350,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                        VariantSection(produk: widget.produk),
                        // const SizedBox(height: 9),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 12,
                            right: 12,
                            top: 5,
                            bottom: 1.0,
                          ),
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          margin: const EdgeInsets.only(bottom: 9.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                c.select != null
                                    ? toCurrency(
                                        widget
                                            .produk
                                            .varianBarang![c.select!]
                                            .harga!,
                                      )
                                    : toCurrency(
                                        filterId.isEmpty
                                            ? widget
                                                  .produk
                                                  .varianBarang![0]
                                                  .harga!
                                            : filterId[0].harga!,
                                      ),
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.apply(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                c.select != null
                                    ? '${widget.produk.nama} - ${widget.produk.varianBarang![c.select!].barang!.varian}'
                                    : '${widget.produk.nama} - ${filterId.isEmpty ? widget.produk.varianBarang![0].barang!.varian : filterId[0].barang!.varian}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 2,
                                    child: Text(
                                      '332 Terjual',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.apply(color: Colors.grey[600]),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.share),
                                      color: Colors.grey[600],
                                      alignment: Alignment.centerRight,
                                      iconSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
                TokoInfo(produk: widget.produk),
                const SizedBox(height: 9),
                SpesifikasiProduct(produk: widget.produk),
                DeskripsiProduct(produk: widget.produk),
                const SizedBox(height: 100.0),
              ],
            ),
          ),
        ),
        Positioned(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              // height: 100,
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.grey[200]!, width: 1.5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      openWhatsApp(phoneNumber: "6285861345339");
                    },
                    icon: SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset('assets/icon-wa.png'),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 1.5,
                          ),
                        ),
                      ),
                      onPressed: () {
                        beliSekarang();
                      },
                      child: Text(
                        'Keranjang',
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      onPressed: () {
                        beliSekarang();
                      },
                      child: Text(
                        'Beli Sekarang',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  beliSekarang() {
    List<VarianBarang> filterId = widget.produk.varianBarang!
        .where((item) => item.barang!.id == widget.produk.id)
        .toList();
    Get.bottomSheet(
      SizedBox(
        height: 300,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                GetBuilder<VarianController>(
                  init: VarianController(),
                  builder: (c) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            c.select != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      '${widget.produk.varianBarang![c.select!].barang!.photo![0].path}',
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      '${widget.produk.photo![0].path}',
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                            const SizedBox(width: 30),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  c.select != null
                                      ? toCurrency(
                                          widget
                                              .produk
                                              .varianBarang![c.select!]
                                              .harga!,
                                        )
                                      : toCurrency(
                                          filterId.isEmpty
                                              ? widget
                                                    .produk
                                                    .varianBarang![0]
                                                    .harga!
                                              : filterId[0].harga!,
                                        ),
                                  style: Theme.of(context).textTheme.titleSmall
                                      ?.apply(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      ),
                                ),
                                Text(
                                  c.select != null
                                      ? 'Stok : ${widget.produk.varianBarang![c.select!].jumlah}'
                                      : 'Stok : ${filterId.isEmpty ? widget.produk.varianBarang![0].jumlah : filterId[0].jumlah}',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        GetBuilder<VarianController>(
                          init: VarianController(),
                          builder: (c) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                  child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(0),
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        widget.produk.varianBarang!.length + 1,
                                    itemBuilder: (context, index) {
                                      final int idx = index + 1;
                                      if (idx !=
                                          (widget.produk.varianBarang!.length +
                                              1)) {
                                        return widget
                                                    .produk
                                                    .varianBarang![index]
                                                    .jumlah ==
                                                0
                                            ? Card(
                                                color: c.select == index
                                                    ? Colors.green[100]
                                                    : Colors.grey[200],
                                                surfaceTintColor: Colors.white,
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  side: BorderSide(
                                                    color: c.select == index
                                                        ? Colors.green
                                                        : Colors.grey[200]!,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                        left: 5,
                                                        right: 10,
                                                        top: 5,
                                                      ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              5,
                                                            ),
                                                        child: Image.network(
                                                          widget
                                                              .produk
                                                              .varianBarang![index]
                                                              .barang!
                                                              .photo![0]
                                                              .path
                                                              .toString(),
                                                          height: 30,
                                                          width: 30,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                              top: 5,
                                                            ),
                                                        child: Text(
                                                          widget
                                                              .produk
                                                              .varianBarang![index]
                                                              .barang!
                                                              .varian!,
                                                          softWrap: true,
                                                          style:
                                                              const TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .black45,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : InkWell(
                                                onTap: () {
                                                  c.changeSelect(index);
                                                },
                                                child: Card(
                                                  color: c.select == index
                                                      ? Colors.green[100]
                                                      : Colors.white,
                                                  surfaceTintColor:
                                                      Colors.white,
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          5,
                                                        ),
                                                    side: BorderSide(
                                                      color: c.select == index
                                                          ? Colors.green
                                                          : Colors.grey[400]!,
                                                      width: 1,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                          left: 5,
                                                          right: 10,
                                                          top: 5,
                                                        ),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                5,
                                                              ),
                                                          child: Image.network(
                                                            widget
                                                                .produk
                                                                .varianBarang![index]
                                                                .barang!
                                                                .photo![0]
                                                                .path
                                                                .toString(),
                                                            height: 30,
                                                            width: 30,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                top: 5,
                                                              ),
                                                          child: Text(
                                                            widget
                                                                .produk
                                                                .varianBarang![index]
                                                                .barang!
                                                                .varian!,
                                                            softWrap: true,
                                                            style:
                                                                const TextStyle(
                                                                  fontSize: 12,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                      } else {
                                        return const SizedBox();
                                      }
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 30),
                GetBuilder<VarianController>(
                  init: VarianController(),
                  builder: (c) {
                    return SizedBox(
                      height: 45,
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
                          if (c.select == null) {
                            EasyLoading.showToast('Pilih Varian');
                          } else {
                            if (widget.produk.varianBarang![c.select!].jumlah ==
                                0) {
                              EasyLoading.showToast('Stok tidak tersedia');
                            } else {
                              Get.to(
                                CheckoutScreen(
                                  varian:
                                      widget.produk.varianBarang![c.select!],
                                ),
                              );
                            }
                          }
                        },
                        child: Text(
                          'Beli Sekarang',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
