import 'package:flutter/material.dart';
import 'package:project1/models/doa_model.dart';
import 'package:project1/services/doa_service.dart';
import 'package:project1/pages/doa/detail_doa_screen.dart';

class ListDoaScreen extends StatelessWidget {
  const ListDoaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FD), // Sama dengan BerandaScreen
      appBar: AppBar(
        title: const Text('Daftar Doa'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.indigo, // Disamakan
        foregroundColor: Colors.white, // Warna teks putih
      ),
      body: FutureBuilder<List<DoaModel>>(
        future: DoaService.fetchDoa(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Terjadi kesalahan: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          final doaList = snapshot.data ?? [];

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: doaList.length,
            itemBuilder: (context, index) {
              final doa = doaList[index];

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailDoaScreen(doa: doa),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(12),
                child: Card(
                  color: Colors.white, // Tetap putih agar kontras
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 20,
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.menu_book,
                            color: Colors.indigo), // Ubah warna ikon
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            doa.doa ?? '-',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios,
                            size: 16, color: Colors.indigoAccent), // Sesuaikan
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
