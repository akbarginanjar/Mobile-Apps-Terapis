import 'package:terapis/global_resource.dart';

class ProdukTerapisScreen extends StatelessWidget {
  const ProdukTerapisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> produk = [
      {
        "nama": "Jahe Merah",
        "harga": "Rp 25.000",
        "gambar":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4k7ZnhB23Ko1jKUPRvaW54ogCN4C07O4CtQ&s",
      },
      {
        "nama": "Kunyit Asam",
        "harga": "Rp 18.000",
        "gambar":
            "https://i0.wp.com/ciputrahospital.com/wp-content/uploads/2024/05/shutterstock_585874274-1.jpg?fit=1000%2C665&ssl=1",
      },
      {
        "nama": "Temulawak",
        "harga": "Rp 22.000",
        "gambar":
            "https://www.karyakreatifindonesia.co.id/download/cHJvZHVjdDpwcm9kdWN0cy9pbWFnZXMvNjItelk2THU3ei0yMDI0MDcxNC5wbmc=",
      },
      {
        "nama": "Sambiloto",
        "harga": "Rp 30.000",
        "gambar":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTk6t1Daq15k4XHgJeBciC51pKosZnz6yv5oA&s",
      },
    ];
    return Scaffold(
      appBar: AppBar(title: Text('Produk Terapis'), centerTitle: true),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 kolom
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          childAspectRatio: 0.85, // atur tinggi card
        ),
        itemCount: produk.length,
        itemBuilder: (context, index) {
          final item = produk[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
              // side: BorderSide(color: Colors.grey[300]!),
            ),
            elevation: 10,
            shadowColor: Colors.black45,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                // aksi saat card ditekan
              },
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        item["gambar"] ?? "",
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Nama Produk
                    Text(
                      item["nama"] ?? "",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      item["harga"] ?? "",
                      style: TextStyle(
                        color: primary,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
