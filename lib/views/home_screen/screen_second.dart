import 'package:terapis/global_resource.dart';
import 'package:terapis/views/notifikasi_screen/screen.dart';
import 'package:terapis/views/profile_screen/screen.dart';

class HomeScreenSecond extends StatelessWidget {
  const HomeScreenSecond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: primary,
        backgroundColor: Colors.white,
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          GetProduk.to.refreshState();
          // GetProduk.to.inisialState();
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              floating: true,
              pinned: true,
              snap: false,
              centerTitle: false,
              title: Text(
                'TERAPIS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              // title: SizedBox(
              //   height: 110,
              //   child: Image.asset(
              //     'assets/balanja-logo.png',
              //     fit: BoxFit.contain,
              //   ),
              // ),
              actions: [
                IconButton(
                  icon: Icon(Icons.notifications_none, color: Colors.blue[800]),
                  onPressed: () {
                    Get.to(const NotifikasiScreen());
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.person_outline_outlined,
                    color: Colors.blue[800],
                  ),
                  onPressed: () {
                    Get.to(const ProfileScreen());
                  },
                ),
                const SizedBox(width: 10),
              ],
              bottom: AppBar(
                elevation: 2,
                shadowColor: Colors.black45,
                surfaceTintColor: Colors.white,
                backgroundColor: Colors.white,
                title: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 0,
                  ),
                  // width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Cari barang dan jasa',
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                      suffix: SizedBox(
                        height: 28,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primary,
                            elevation: 0,
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Cari',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 0,
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 0,
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Other Sliver Widgets
            SliverList(
              delegate: SliverChildListDelegate([
                const Carousel(
                  listImage: [
                    'assets/banner/bannerbalanja1.png',
                    'assets/banner/bannerbalanja2.png',
                    'assets/banner/bannerbalanja3.png',
                  ],
                ),
                const SizedBox(height: 10.0),
                FutureBuilder(
                  future: loadToko(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return PilihToko(toko: 'Loading...', onTap: () {});
                    }
                    return PilihToko(
                      toko: GetStorage().read('id_toko') == null
                          ? 'Semua produk'
                          : GetStorage().read('nama_toko'),
                      onTap: () {},
                    );
                  },
                ),
                const SizedBox(height: 7),

                const Pengumuman(
                  teks:
                      'Layanan transaksi sengan Bank BCA dan tarik saldo ke rekening BCA tidak dapat dilakukan pada 4 Februrari 2024 pukul 01:00-04:00 WIB.',
                ),
                const SizedBox(height: 10),
                const MenuHomeScreen(),
                const SizedBox(height: 10),
                const ProductSection(title: 'Untuk Kamu'),
                const SizedBox(height: 10.0),
                const BannerPromo(
                  urlImage:
                      'https://www.tanamduit.com/wp-content/uploads/2021/08/promo-linkaja-kemerdekaan-blog-banner.png',
                ),
                const SizedBox(height: 20.0),
                // const ProductSection(
                //   title: 'Untuk Kamu',
                // ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> loadToko() async {
  await Future.delayed(const Duration(seconds: 1));
  await GetStorage().read('nama_toko');
}
