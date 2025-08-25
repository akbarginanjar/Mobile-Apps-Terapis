import 'package:terapis/global_resource.dart';

class Voucher extends StatelessWidget {
  const Voucher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.defaultDialog(
          backgroundColor: Colors.white,
          title: 'Voucher',
          content: const Center(
            child: Text(
              'Voucher Belum Tersedia',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Oke'),
            ),
          ],
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 25,
                width: 25,
                child: Image.network(
                  'https://cdn-icons-png.freepik.com/512/5733/5733329.png',
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'Voucher Balanja',
                style: TextStyle(color: Colors.black87),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.grey[500],
            size: 14,
          ),
        ],
      ),
    );
  }
}
