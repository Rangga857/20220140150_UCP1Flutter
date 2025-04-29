import 'package:flutter/material.dart';

class DetailPelangganPage extends StatelessWidget {
  final String nama;
  final String email;
  final String noHp;
  final String alamat;
  final String provinsi;
  final String kodePos;

  const DetailPelangganPage({
    super.key,
    required this.nama,
    required this.email,
    required this.noHp,
    required this.alamat,
    required this.provinsi,
    required this.kodePos,
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 85, 0),
        title: Text('Detail $nama', 
        style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('./assets/images/profile.png'), // Ganti dengan path gambar default kamu
            ),
            const SizedBox(height: 16),
            Text(nama, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(email, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 4),
            Text(noHp, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 32),
            formdetail('Alamat', alamat),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: formdetail('Provinsi', provinsi)),
                const SizedBox(width: 16),
                Expanded(child: formdetail('Kode Pos', kodePos)),
              ],
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 85, 0),
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: const Text('Selesai', style: TextStyle(fontSize: 17, color: Colors.white))
            ),
          ],
        ),
      ),
    );
  }
  Widget formdetail(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: value,
          readOnly: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          ),
        ),
      ],
    );
  }
}