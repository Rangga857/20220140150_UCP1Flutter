import 'package:flutter/material.dart';

class BarangPage extends StatefulWidget {
  const BarangPage({super.key});

  @override
  State<BarangPage> createState() => _BarangPageState();
}

class _BarangPageState extends State<BarangPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController jumlahController = TextEditingController();
    TextEditingController ttanggalController = TextEditingController();
    DateTime? selectedDate;
    String? selectedTransaksi;
    String? selectedBarang;
    int hargaSatuan = 0;
    int totalHarga = 0;

    final List<String> jenisTransaksi = ['Masuk', 'Keluar'];
    final Map<String, int> jenisBarang = {
      'Matras': 100000,
      'Sepatu': 5000000,
      'Carrier': 3000000,
      'Sleeping Bag': 200000,
    };
    
    return const Placeholder();
  }
}