// lib/helpers/base.dart
// File ini berisi semua konstanta dasar (Route Names dan Storage Keys)

abstract class Base {
  // Konstanta untuk Kunci GetStorage (Penyimpanan Lokal)
  // Kita pertahankan strukturnya agar siap untuk masa depan.
  static String token = "tokens"; // Key untuk menyimpan token login
  static String user = "users";   // Key untuk menyimpan data user
  static String access = "access";
  static String gudang = "gudang";
}


// =========================================================================
// RUTE NAVIGASI (ROUTE NAMES)
// Mengikuti pola abstract class ERP Anda
// =========================================================================

abstract class RouteName {
  // Error Page
  static const noPage = "/404";
  static const maintanancePage = "/maintanance";
  
  // Auth Page
  static const splash = "/splash_screen";
  static const login = "/login_screen";
  static const register = "/register_screen"; 

  // Home Page
  static const home = "/home_screen";
  
  // Profile Page
  static const profile = "/profile_screen";

  static const produk = "/produk"; 
  static const keranjang = "/keranjang";
  static const checkout = "/checkout";

  // Rute Tambahan (Bisa ditambah nanti)
  // static const notifikasi = "/notifikasi"; 
}


// =========================================================================
// OFFLINE STORAGE KEYS (untuk GetStorage/penyimpanan lokal)
// =========================================================================

abstract class OflineBase {
  // Keranjang Belanja (Relevan untuk Balanja.id)
  static const keranjangList = "list_keranjang"; 

  // Data Umum
  static const konsumenList = "list_konsumen";
  static const produkList = "list_produk";
}