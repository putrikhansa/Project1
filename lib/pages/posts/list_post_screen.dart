import 'package:flutter/material.dart';
import 'package:project1/models/post_model.dart';
import 'package:project1/services/post_service.dart';

class ListPostScreen extends StatelessWidget {
  const ListPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Post'),
      ),
      body: FutureBuilder<List<PostModel>>(
        future: PostService.ListPost(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final dataPost = snapshot.data ?? [];

          if (dataPost.isEmpty) {
            return const Center(child: Text('Tidak ada post.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: dataPost.length,
            itemBuilder: (context, index) {
              final data = dataPost[index];
              return Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: CircleAvatar(
                    child: Text(data.id.toString()),
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                  ),
                  title: Text(
                    data.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('User ID: ${data.userId}'),
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
