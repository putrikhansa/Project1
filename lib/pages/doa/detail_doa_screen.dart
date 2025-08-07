import 'package:flutter/material.dart';
import 'package:project1/models/doa_model.dart';

class DetailDoaScreen extends StatelessWidget {
  final DoaModel doa;

  const DetailDoaScreen({super.key, required this.doa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Detail Doa'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Judul Doa
            Text(
              doa.doa ?? '-',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 32),

            // Ayat Arab
            Text(
              doa.ayat ?? '-',
              style: const TextStyle(
                fontSize: 28,
                height: 2,
              ),
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
            ),

            const SizedBox(height: 24),

            // Latin
            Text(
              doa.latin ?? '-',
              style: const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),

            const SizedBox(height: 24),

            // Terjemahan
            Text(
              doa.artinya ?? '-',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
