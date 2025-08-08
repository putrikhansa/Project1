import 'package:flutter/material.dart';
import 'package:project1/pages/beranda_screen.dart';
import 'package:project1/pages/doa/list_doa_screen.dart';
import 'package:project1/pages/posts/list_post_screen.dart';
import 'package:project1/pages/product/product_list_screen.dart';
import 'package:project1/pages/product_dummy/product_list_dummy_screen.dart'; // produk dummy
import 'package:project1/pages/profile_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    BerandaScreen(),
    ListDoaScreen(),
    ProductListScreen(), // Produk asli
    ProductListDummyScreen(), // Produk dummy
    ListPostScreen(), // Contoh halaman tambahan, bisa kamu ganti
    ProfileScreen(),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.book,
    Icons.shopping_cart,
    Icons.shopping_bag, // beda ikon supaya gampang dibedain
    Icons.article,
    Icons.person,
  ];

  final List<String> _labels = [
    "Beranda",
    "Posts",
    "Produk",
    "Produk Dummy",
    "Menu",
    "Profil",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_icons.length, (index) {
            final bool isSelected = index == _currentIndex;
            return GestureDetector(
              onTap: () => setState(() => _currentIndex = index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: isSelected ? 20 : 0,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.grey[900] : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Icon(
                      _icons[index],
                      color: isSelected ? Colors.white : Colors.grey[500],
                    ),
                    if (isSelected) ...[
                      const SizedBox(width: 6),
                      Text(
                        _labels[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
