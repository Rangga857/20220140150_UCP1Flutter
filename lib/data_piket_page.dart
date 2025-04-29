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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 85, 0),
        centerTitle: true,
        title: const Text('Piket Gudang',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nama Anggota', style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 8),
              TextFormField(
                controller: namaController,
                readOnly: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text('Pilih Tanggal', style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 8),
              InkWell(
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    setState(() {
                      selectedDate = picked;
                      dateError = null;
                    });
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: dateError == null ? Colors.grey.shade400 : Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_today, size: 20),
                          const SizedBox(width: 12),
                          Text(
                            selectedDate != null
                                ? DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(selectedDate!)
                                : 'Pilih Tanggal',
                            style: TextStyle(
                              fontSize: 16,
                              color: selectedDate != null ? Colors.black : const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (dateError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 12),
                        child: Text(
                          dateError!,
                          style: const TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                  ],
                ),
              )
            ],
          )),
      ),
    );
  }
}