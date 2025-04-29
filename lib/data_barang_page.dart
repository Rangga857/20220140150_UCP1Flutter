import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BarangPage extends StatefulWidget {
  const BarangPage({super.key});

  @override
  State<BarangPage> createState() => _BarangPageState();
}

class _BarangPageState extends State<BarangPage> {
    TextEditingController jumlahController = TextEditingController();
    TextEditingController tanggalController = TextEditingController();
    DateTime? selectedDate;
    String? selectedTransaksi;
    String? selectedBarang;
    int hargaSatuan = 0;
    int totalHarga = 0;

    final List<String> jenisTransaksi = ['Barang Masuk', 'Barang Keluar'];
    final Map<String, int> jenisBarang = {
      'Matras': 100000,
      'Sepatu': 5000000,
      'Carrier': 3000000,
      'Sleeping Bag': 200000,
    };
    
    final _formKey = GlobalKey<FormState>();

    Future<void> _selectedDate(BuildContext context) async{
      final DateTime? picked = await showDatePicker(
        context: context, 
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(2020), 
        lastDate: DateTime(2050)
      );
      if (picked != null){
        setState(() {
          selectedDate = picked;
          tanggalController.text = DateFormat('EEE, d MMMM yyyy', 'id_ID')
          .format(picked);
        });
      }
    }

    void calculateTotal(){
      if (jumlahController.text.isNotEmpty && hargaSatuan != 0){
        int jumlah = int.tryParse(jumlahController.text) ?? 0;
        setState(() {
          totalHarga = hargaSatuan * jumlah;
        });
      }
    }

    @override
    void dispose() {
      jumlahController.dispose();
      tanggalController.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
    );
  }
}