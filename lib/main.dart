import 'package:flutter/material.dart';

// Modul Praktikum 1 - Penyiapan Lingkungan Pengembangan Flutter

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SiLog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: const BerandaPage(),
    );
  }
}

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SiLog - Modul 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.local_shipping,
              size: 80,
            ),
            const SizedBox(height: 16),
            const Text(
              'Sistem Informasi Logistik - ULBI',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Lingkungan pengembangan siap digunakan.',
            ),
            const SizedBox(height: 24),
            const Text(
              'Nama: Nanda Septiana Ramadhani',
            ),
            const Text(
              'NIM: 714240033',
            ),
            const Text(
              'Kelas: 3C D4 TI',
            ),
          ],
        ),
      ),
    );
  }
}