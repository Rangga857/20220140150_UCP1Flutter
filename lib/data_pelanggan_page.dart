import 'package:flutter/material.dart';
import 'package:ucp1/detail_pelanggan.dart';

class PelangganPage extends StatefulWidget {
  const PelangganPage({super.key});

  @override
  State<PelangganPage> createState() => _PelangganPageState();
}

class _PelangganPageState extends State<PelangganPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nohpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController provinsiController = TextEditingController();
  final TextEditingController kodeposController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _resetForm() {
    namaController.clear();
    emailController.clear();
    nohpController.clear();
    alamatController.clear();
    provinsiController.clear();
    kodeposController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 85, 0),
        title: const Text('Data Pelanggan', 
        style: TextStyle(color: Colors.white)),
        centerTitle: true,
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
              formTextField('Nama Cust', namaController),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: formTextField('Email', emailController)),
                  SizedBox(width: 16),
                  Expanded(child: formTextField('No Hp', nohpController)),
                ],
              ),
              SizedBox(height: 16),
              formTextField('Alamat', alamatController),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: formTextField('Provinsi', provinsiController)),
                  SizedBox(width: 16),
                  Expanded(child: formTextField('Kode Pos', kodeposController)),
                ],
              ), 
              SizedBox(height: 32),  
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: const Color.fromARGB(255, 255, 85, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPelangganPage(
                          nama: namaController.text,
                          email: emailController.text,
                          noHp: nohpController.text,
                          alamat: alamatController.text,
                          provinsi: provinsiController.text,
                          kodePos: kodeposController.text,
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Simpan', style: TextStyle(fontSize: 17, color: Colors.white)),
              ),  
              SizedBox(height: 16),  
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: _resetForm,
                child: const Text('Reset', style: TextStyle(color: Color.fromARGB(255, 255, 85, 0), fontSize: 17)),
              ),    
            ],
          ),
        ),
      ),
    );
  }

  Widget formTextField (String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: label == 'No Hp' || label == 'Kode Pos'
              ? TextInputType.number
              : TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '$label tidak boleh kosong';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ],
    );
  }
}