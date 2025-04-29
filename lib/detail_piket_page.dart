import 'package:flutter/material.dart';

class DetailPiketPage extends StatelessWidget {
  final String tugas;
  final String tanggal;
  final String nama;
  const DetailPiketPage({
    super.key,
    required this.tugas,
    required this.tanggal,
    required this.nama,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 85, 0),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Detail $tugas',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}