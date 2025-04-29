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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    tanggal,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 255, 85, 0),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 85, 0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    nama,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24), 

           Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 85, 0),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                tugas,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          )
          ],
        ),
      ),
    );
  }
}