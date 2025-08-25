import 'package:terapis/global_resource.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: theme(),
      debugShowCheckedModeBanner: false,
      title: 'Balanja.id',
      home: const SplashScreen(),
      builder: EasyLoading.init(),
    );
  }
}
