import 'package:terapis/global_resource.dart';
import 'package:terapis/views/terapis/components/dokter_card.dart';

class TerapisScreen extends StatelessWidget {
  const TerapisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cari Terapis'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [DokterCard(), DokterCard(), DokterCard()],
        ),
      ),
    );
  }
}
