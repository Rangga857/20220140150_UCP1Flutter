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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 85, 0),
        title: const Text('Pendataan Barang', 
        style: TextStyle(
          fontSize: 20, 
          fontWeight: FontWeight.w400, 
          color: Colors.white
          )
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 6),
                Text("Tanggal Transaksi",style: 
                TextStyle(fontWeight: FontWeight.bold)
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: tanggalController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Tanggal Transaksi',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    suffixIcon: const Icon(Icons.calendar_today),
                  ),
                  onTap: () => _selectedDate(context),
                  validator: (value) => value == null || value.isEmpty ? 'Tanggal transaksi wajib diisi' : null,
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Jenis Transaksi',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  value: selectedTransaksi,
                  items: jenisTransaksi.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedTransaksi = newValue;
                    });
                  },
                  validator: (value) => value == null || value.isEmpty ? 'Jenis transaksi wajib dipilih' : null,
                ),
                const SizedBox(height: 24),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Jenis Barang',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  value: selectedBarang,
                  items: jenisBarang.keys.map((String key) {
                    return DropdownMenuItem<String>(
                      value: key,
                      child: Text(key),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedBarang = newValue;
                      hargaSatuan = jenisBarang[newValue!]!;
                      calculateTotal();
                    });
                  },
                  validator: (value) => value == null || value.isEmpty ? 'Jenis barang wajib dipilih' : null,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text('Jumlah Barang', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      TextFormField(
                        controller: jumlahController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onChanged: (value) {
                          calculateTotal();
                        },
                        validator: (value) => value == null || value.isEmpty ? 'Jumlah barang wajib diisi' : null,
                      ),
                      ] 
                    ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Harga Satuan', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        TextFormField(
                          readOnly: true,
                        decoration: InputDecoration(
                          prefixText: 'Rp. ',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        controller: TextEditingController(text: hargaSatuan.toString()),
                      ),]
                      ) 
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 85, 0),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailBarangPage(
                              tanggal: tanggalController.text,
                              jenisTransaksi: selectedTransaksi ?? '',
                              jenisBarang: selectedBarang ?? '',
                              jumlahBarang: int.tryParse(jumlahController.text) ?? 0,
                              hargaSatuan: hargaSatuan,
                              totalHarga: totalHarga,
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text('Submit', style: TextStyle(fontSize: 17, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ))
        ),
    );
  }
}