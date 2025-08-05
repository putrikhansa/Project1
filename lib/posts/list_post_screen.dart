// ignore_for_file: avoid_web_libraries_in_flutter, unused_import, prefer_const_constructors

import 'dart:html';
import 'package:flutter/material.dart';
import 'package:project1/models/post_model.dart';
import 'package:project1/services/post_service.dart';

class ListPostScreen extends StatelessWidget {
  const ListPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.amber,
      child: FutureBuilder<List<PostModel>>(
        future: PostService.ListPost(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final dataPost = snapshot.data ?? [];
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: dataPost.length,
            itemBuilder: (context, index) {
              final data = dataPost[index];
              return GestureDetector(
                // onTap: (){
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (_) => PostDetailScreen(
                //         id: data.id.toString(),
                //         title: data.title,
                //         body: data.body
                //         userId: data.userId.toString(),
                //      ),
                //     ),
                //   );
                // },
                child: ListTile(
                  leading: Text(data.id.toString()),
                  title: Text(data.title),
                  subtitle: Text('User ID: ${data.userId}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
