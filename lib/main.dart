import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// Import file-file lokal yang diperlukan
import 'helpers/theme.dart'; 
import 'routes/routes_pages.dart'; 
import 'views/error/no_screen.dart';
import 'views/splash/splash_screen.dart';

void main() async {
  // 1. Inisialisasi GetStorage: Wajib dilakukan di awal
  await GetStorage.init(); 
  
  // 2. Memastikan binding Flutter sudah diinisialisasi
  WidgetsFlutterBinding.ensureInitialized(); 
      
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { // <--- CLASS INI YANG DICARI
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Balanja',
      
      // unknownRoute: GetPage(
      //   name: RouteName.noPage, 
      //   page: () => const NoScreen(), 
      // ),
      
      theme: theme(),
      
      getPages: Routes.pages,
      
      home: const SplashScreen(), 
    );
  }
}