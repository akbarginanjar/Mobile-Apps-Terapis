import 'package:terapis/global_resource.dart';
import 'package:terapis/views/metode_pembayaran_screen/metode_pembayaran_checkout.dart';

class MetodePembayaran extends StatelessWidget {
  const MetodePembayaran({super.key});

  @override
  Widget build(BuildContext context) {
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
                Icons.payment,
                size: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 6.0),
              Text(
                "Metode Pembayaran",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.apply(color: Colors.black87),
              ),
            ],
          ),
          Divider(color: Colors.grey[200], thickness: 2.0),
          GetBuilder<CheckoutController>(
            init: CheckoutController(),
            builder: (metodeController) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    metodeController.judul != null
                        ? metodeController.judul.toString()
                        : 'Metode Pembayaran',
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.apply(color: Colors.grey[600]),
                  ),
                  Text(
                    metodeController.metode != null
                        ? metodeController.metode.toString()
                        : 'Pilih',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.apply(color: Colors.black87),
                  ),
                ],
              );
            },
          ),
          Divider(color: Colors.grey[200], thickness: 1.0),
          GetBuilder<CheckoutController>(
            init: CheckoutController(),
            builder: (metodeController) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text(
                      metodeController.noRekening != null
                          ? 'No Rekening : ${metodeController.noRekening.toString()}'
                          : '-',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.apply(color: Colors.black87),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        Get.to(const MetodePembayaranScreen());
                      },
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
                            'Ubah',
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
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
