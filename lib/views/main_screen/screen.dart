import 'package:terapis/controllers/main_controller.dart';
import 'package:terapis/views/home_screen/screen.dart';
import 'package:terapis/views/pesanan_screen/screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const PesananScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (value) {
        return Scaffold(
          body: _screens[value.index],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            iconSize: 25,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            onTap: (v) {
              value.changeIndex(v);
            },
            currentIndex: value.index,
            enableFeedback: true,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.file_copy_outlined),
                label: 'Riwayat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: 'Keranjang',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profil',
              ),
            ],
          ),
        );
      },
    );
  }
}
