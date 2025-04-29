import 'package:flutter/material.dart';

class DetailBarangPage extends StatelessWidget {
  final String tanggal;
  final String jenisTransaksi;
  final String jenisBarang;
  final int jumlahBarang;
  final int hargaSatuan;
  final int totalHarga;

  const DetailBarangPage({
    super.key,
    required this.tanggal,
    required this.jenisTransaksi,
    required this.jenisBarang,
    required this.jumlahBarang,
    required this.hargaSatuan,
    required this.totalHarga,});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle_outline_rounded, size: 120, color: Colors.green),
              const SizedBox(height: 16),
              const Text(
                'Data Berhasil Disimpan',
                style: TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.bold,),
              ),
              const SizedBox(height: 32),
              formtextfield('Tanggal', tanggal),
              formtextfield('Jenis Transaksi', 'Barang $jenisTransaksi'),
              formtextfield('Jenis Barang', jenisBarang),
              formtextfield('Jumlah Barang', jumlahBarang.toString()),
              formtextfield('Harga Satuan', 'Rp. $hargaSatuan'),
              formtextfield('Total Harga', 'Rp. $totalHarga'),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 85, 0),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: const Text('Selesai', 
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

    Widget formtextfield (String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        readOnly: true,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black38),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black54, width: 1.5),
          ),
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 12), 
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(width: 12), 
            ],
          ),
        ),
      ),
    );
  }
}