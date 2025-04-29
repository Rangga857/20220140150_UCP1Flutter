import 'package:flutter/material.dart';

class BarangPage extends StatefulWidget {
  const BarangPage({super.key});

  @override
  State<BarangPage> createState() => _BarangPageState();
}

class _BarangPageState extends State<BarangPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController namaController = TextEditingController();
    TextEditingController tugasController = TextEditingController();
    DateTime? selectedDate;
    String? dateError;
    List<Map<String, String>> listtugas = [];
    return const Placeholder();
  }
}