import 'package:terapis/config/theme.dart';
import 'package:terapis/global_resource.dart';

class TokoInfo extends StatelessWidget {
  final Produk? produk;
  const TokoInfo({super.key, this.produk});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 11.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Flexible(
              //     flex: 1,
              //     child: ClipRRect(
              //         borderRadius: BorderRadius.circular(10.0),
              //         child: Image.network(
              //           'https://static.sehatq.com/content/review/product/image/767120211206100834.jpeg',
              //           fit: BoxFit.cover,
              //           width: 60,
              //         ))),
              Flexible(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.only(left: 3.0, right: 2.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.store, color: primary2),
                          const SizedBox(width: 5),
                          Text(
                            produk!.varianBarang![0].gudang!.namaGudang
                                .toString(),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(
                              context,
                            ).textTheme.titleMedium?.apply(color: Colors.black),
                          ),
                        ],
                      ),
                      Text(
                        produk!.varianBarang![0].gudang!.alamat.toString(),
                        maxLines: 1,
                        softWrap: true,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.apply(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
              // Flexible(
              //     flex: 1,
              //     child: Center(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         children: [
              //           Text('Rating',
              //               maxLines: 1,
              //               textAlign: TextAlign.center,
              //               softWrap: true,
              //               style: Theme.of(context)
              //                   .textTheme
              //                   .bodySmall
              //                   ?.apply(color: Colors.black)),
              //           Text('5.1',
              //               maxLines: 1,
              //               textAlign: TextAlign.center,
              //               softWrap: true,
              //               style: Theme.of(context)
              //                   .textTheme
              //                   .titleLarge
              //                   ?.apply(color: Colors.black)),
              //         ],
              //       ),
              //     ))
            ],
          ),
          Divider(color: Colors.grey[200], thickness: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '130+ ',
                        maxLines: 1,
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyMedium?.apply(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Text(
                        'Produk',
                        maxLines: 1,
                        softWrap: true,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.apply(color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.primary.withOpacity(0.2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Buka Toko',
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Theme.of(context).colorScheme.primary,
                      size: 16.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
