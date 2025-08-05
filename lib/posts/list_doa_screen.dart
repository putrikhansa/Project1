import 'package:flutter/material.dart';
import 'package:project1/models/doa_model.dart';
import 'package:project1/services/doa_service.dart';
import 'package:project1/posts/detail_doa_screen.dart';

class ListDoaScreen extends StatelessWidget {
  const ListDoaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kumpulan Doa'),
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
      ),
      body: FutureBuilder<List<DoaModel>>(
        future: DoaService.fetchDoa(), // ✅ Ambil data dari API
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada data doa'));
          }

          final doaList = snapshot.data!;

          return ListView.builder(
            itemCount: doaList.length,
            itemBuilder: (context, index) {
              final doa = doaList[index];
              return Card(
                child: ListTile(
                  title: Text(
                    doa.doa,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailDoaScreen(doa: doa),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
