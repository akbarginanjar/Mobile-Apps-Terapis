import 'package:terapis/global_resource.dart';

class PilihToko extends StatelessWidget {
  final String toko;
  final Function() onTap;

  const PilihToko({super.key, required this.toko, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(
          color: Color.fromARGB(255, 214, 214, 214),
          width: 1.3,
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: ListTile(
        onTap: () {
          Get.to(
            const TokoScreen(),
            transition: Transition.rightToLeftWithFade,
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
        leading: Icon(Icons.store, color: primary2),
        title: Text(
          GetStorage().read('id_toko') == null ? 'Semua produk' : toko,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        trailing: GetStorage().read('id_toko') == null
            ? Text(
                'Pilih Gerai',
                style: GoogleFonts.montserrat(fontSize: 12, color: Colors.grey),
              )
            : const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 15),
      ),
    );
  }
}
