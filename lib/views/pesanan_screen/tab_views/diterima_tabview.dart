import 'package:terapis/global_resource.dart';
import 'package:terapis/views/pesanan_screen/diterima_card.dart';

class DiterimaTabview extends StatelessWidget {
  const DiterimaTabview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<List<dynamic>>(
              future: TransaksiServiceController().getTransaksiDiterima(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox(height: 160, child: LoadingProses());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return DiterimaCard(transaksi: snapshot.data![index]);
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
