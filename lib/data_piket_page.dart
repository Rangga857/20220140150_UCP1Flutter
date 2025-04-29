import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  void initState() {
    super.initState();
    namaController.text = widget.nama;
  }

  void tambahtugas() {
    final isValid = _formKey.currentState!.validate();
    final isDateSelected = selectedDate != null;

    setState(() {
      if (isValid && isDateSelected) {
        taskList.add({
          'task': tugasController.text,
          'date': DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(selectedDate!),
          'user': namaController.text,
        });
        tugasController.clear();
        selectedDate = null;
        dateError = null;
      } else {
        dateError = isDateSelected ? null : 'Tanggal harus dipilih';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}