import 'package:terapis/global_resource.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: GetBuilder<SplashController>(
        init: SplashController(),
        builder: (s) {
          return Center(
            child: Text(
              'TERAPIS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            // child: ClipRRect(
            //   borderRadius: BorderRadius.circular(20),
            //   child: Image.asset(
            //     'assets/balanja-logo-icon.jpg',
            //     fit: BoxFit.cover,
            //     width: MediaQuery.of(context).size.width / 2.0,
            //   ),
            // ),
          );
        },
      ),
    );
  }
}
