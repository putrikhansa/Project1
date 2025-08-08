import 'package:flutter/material.dart';
import 'package:project1/models/post_model.dart';
import 'package:project1/services/post_service.dart';

class ListPostScreen extends StatelessWidget {
  const ListPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FD), // ✅ Sama dengan Beranda
      appBar: AppBar(
        title: const Text('Daftar Post'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.indigo, // ✅ Warna utama
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<PostModel>>(
        future: PostService.ListPost(),
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

          final dataPost = snapshot.data ?? [];

          if (dataPost.isEmpty) {
            return const Center(child: Text('Tidak ada post.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: dataPost.length,
            itemBuilder: (context, index) {
              final data = dataPost[index];
              return Card(
                color: Colors.white,
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: CircleAvatar(
                    backgroundColor: Colors.indigoAccent, // ✅ Warna disamakan
                    foregroundColor: Colors.white,
                    child: Text(
                      data.id.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(
                    data.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text('User ID: ${data.userId}'),
                  trailing: const Icon(Icons.arrow_forward_ios,
                      size: 16, color: Colors.indigoAccent),
                  onTap: () {
                    // TODO: Navigate to detail screen
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
