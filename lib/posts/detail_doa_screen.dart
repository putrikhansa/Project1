import 'package:flutter/material.dart';
import 'package:project1/models/doa_model.dart';

class DetailDoaScreen extends StatelessWidget {
  final DoaModel doa;

  const DetailDoaScreen({super.key, required this.doa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(doa.doa),
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doa.ayat,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 16),
            Text(
              doa.latin,
              style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 16),
            Text(
              doa.artinya,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
