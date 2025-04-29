import 'package:flutter/material.dart';

class PelangganPage extends StatefulWidget {
  const PelangganPage({super.key});

  @override
  State<PelangganPage> createState() => _PelangganPageState();
}

class _PelangganPageState extends State<PelangganPage> {
  @override
  Widget build(BuildContext context) {
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
    
    return const Placeholder();
  }
}