import 'package:terapis/global_resource.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: EdgeInsets.all(0),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              color: primary,
              child: Container(
                decoration: BoxDecoration(gradient: primaryGradient),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 40,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 35,
                                width: 35,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.person, color: primary),
                                ),
                              ),
                              SizedBox(width: 7),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Selamat datang',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Halo, Akbar Ginanjar',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Carousel(
                      listImage: [
                        'https://greencairoindia.com/wp-content/uploads/2024/07/green-cairo-web-banner.png',
                        'https://www.cmgherbals.com/images/sliders/slider-1.png',
                      ],
                    ),
                    SizedBox(height: 3),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Card(
              color: Colors.white,
              surfaceTintColor: Colors.white,
              elevation: 5,
              shadowColor: Colors.black45,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                // side: BorderSide(color: Colors.grey[300]!),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: ListTile(
                onTap: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Terapis Koin',
                      style: TextStyle(color: primary, fontSize: 10),
                    ),
                    Text(
                      'Saldo : 0 Koin',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey,
                  size: 17,
                ),
              ),
            ),
            MenuHomeScreen(),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Produk Kesehatan Untukmu',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 210,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: produk.length,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (context, index) {
                  final item = produk[index];
                  return Container(
                    width: 140,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                      shadowColor: Colors.black45,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
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
                                style: TextStyle(color: primary, fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
