import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Sesuaikan import controller Anda jika pathnya berbeda
import '../../controllers/splash_controller.dart'; 
import '../../helpers/constants.dart'; // Untuk warna kPrimaryColor

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi controller di sini agar logika (checkAuthStatus) berjalan
    return GetBuilder<SplashController>(
      init: SplashController(), 
      builder: (s) => Scaffold(
        // Gunakan warna primer atau warna lain yang sesuai dengan brand
        backgroundColor: kPrimaryColor, // Ganti hitam dengan Hijau Balanja.id
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 1. Logo Aplikasi
              const Image(
                image: AssetImage("assets/icons/balanja-logo-icon.jpg"), 
                height: 120, // Tambahkan tinggi agar logo terlihat
                // Pastikan Anda sudah membuat folder 'assets/images/' dan meletakkan 'logo.png' di sana
              ),
              const SizedBox(height: 10),
              
              // 2. Nama Aplikasi
              const Text(
                'BALANJA', 
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white, // Teks putih agar kontras dengan latar belakang hijau
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              
              // 3. Loading Indikator
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}