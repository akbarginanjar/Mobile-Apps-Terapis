import 'package:terapis/global_resource.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            width: double.maxFinite,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 15),
                  child: const Icon(Icons.account_circle, size: 90),
                ),
                const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.account_circle),
                          Text("Jelang Anugrah Raharjo"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.email_rounded),
                          Text("anugrahjelang@gmail.com"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.account_balance_wallet),
                          Text("Saldo RP. 20000"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: primary),
            onPressed: () {
              GetStorage().remove('tokens');
              GetStorage().remove('id');
              GetStorage().remove('no_hp');
              GetStorage().remove('email');
              GetStorage().remove('nama_lengkap');
              GetStorage().remove('member_id');
              GetStorage().remove('nama_toko');
              GetStorage().remove('id_toko');
              Get.offAll(
                const LoginScreen(),
                transition: Transition.rightToLeft,
              );
            },
            child: const Text('Logout', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
