import 'package:flutter/material.dart';

class DataPiketPage extends StatefulWidget {
  final String nama;

  const DataPiketPage({super.key, required this.nama});

  @override
  State<DataPiketPage> createState() => _DataPiketPageState();
}

class _DataPiketPageState extends State<DataPiketPage> {
  TextEditingController namaController = TextEditingController();
  TextEditingController tugasController = TextEditingController();
  DateTime? selectedDate;
  String? dateError;
  List<Map<String, String>> taskList = [];

  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}