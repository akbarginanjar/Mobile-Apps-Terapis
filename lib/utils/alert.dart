import 'package:terapis/global_resource.dart';

loadingPage() {
  Get.dialog(
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.2),
    const Center(
      child: SizedBox(
        height: 115,
        child: Card(
          elevation: 0,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                CircularProgressIndicator(strokeWidth: 3),
                SizedBox(height: 15),
                Text('Loading...', style: TextStyle(fontSize: 10)),
              ],
            ),
          ),
        ),
      ), // Menampilkan indikator loading
    ),
  );
}

noInternet() {
  Get.dialog(
    barrierColor: Colors.black.withOpacity(0.2),
    Center(
      child: SizedBox(
        width: 300,
        height: 195,
        child: Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.wifi),
                    SizedBox(width: 10),
                    Text(
                      'Tidak ada internet',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                  'Silahkan periksa kembali koneksi internet anda.',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: primary),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'OKE',
                    style: GoogleFonts.montserrat(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ), // Menampilkan indikator loading
    ),
  );
}

// Fungsi untuk menampilkan pesan alert
showErrorDialog(String message) {
  Get.dialog(
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.2),
    AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      title: const Text('Login Gagal!'),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
            Get.back();
          },
          child: const Text('OKE'),
        ),
      ],
    ),
  );
}
