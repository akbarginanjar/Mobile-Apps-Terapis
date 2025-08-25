import 'package:terapis/global_resource.dart';
import 'package:terapis/views/terapis/terapis_screen.dart';

class MenuHomeScreen extends StatelessWidget {
  const MenuHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Column(
            children: [
              SizedBox(
                height: 65,
                width: 65,
                child: Card(
                  color: Colors.white,
                  surfaceTintColor: Colors.white,
                  elevation: 5,
                  shadowColor: Colors.black45,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(color: Colors.grey[300]!),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30.0),
                    onTap: () {
                      Get.to(TerapisScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(13),
                      child: Image.asset('assets/icon/terapis.png'),
                    ),
                  ),
                ),
              ),
              Text('Cari', style: GoogleFonts.poppins(fontSize: 9)),
              Text('Terapis', style: GoogleFonts.poppins(fontSize: 9)),
            ],
          ),
          SizedBox(width: 10),
          Column(
            children: [
              SizedBox(
                height: 65,
                width: 65,
                child: Card(
                  color: Colors.white,
                  surfaceTintColor: Colors.white,
                  elevation: 5,
                  shadowColor: Colors.black45,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(color: Colors.grey[300]!),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30.0),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(13),
                      child: Image.asset('assets/icon/herbal.png'),
                    ),
                  ),
                ),
              ),
              Text('Produk', style: GoogleFonts.poppins(fontSize: 9)),
              Text('Herbal', style: GoogleFonts.poppins(fontSize: 9)),
            ],
          ),
          SizedBox(width: 10),
          Column(
            children: [
              SizedBox(
                height: 65,
                width: 65,
                child: Card(
                  color: Colors.white,
                  surfaceTintColor: Colors.white,
                  elevation: 5,
                  shadowColor: Colors.black45,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(color: Colors.grey[300]!),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30.0),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(13),
                      child: Image.asset('assets/icon/pelatihan.png'),
                    ),
                  ),
                ),
              ),
              Text('Pelatihan', style: GoogleFonts.poppins(fontSize: 10)),
              Text('Terapis', style: GoogleFonts.poppins(fontSize: 9)),
            ],
          ),
        ],
      ),
    );
  }
}
