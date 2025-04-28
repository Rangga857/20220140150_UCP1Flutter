import 'package:flutter/material.dart';
import 'package:ucp1/data_barang_page.dart';
import 'package:ucp1/data_pelanggan_page.dart';
import 'package:ucp1/data_piket_page.dart';
import 'package:ucp1/login_page.dart';

class HomePage extends StatefulWidget {
  final String nama;
  
  const HomePage({super.key, required this.nama});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController namaController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70), 
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 255, 85, 0),
          elevation: 0,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Selamat Datang",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        )
                      ),
                      SizedBox(height: 4),
                      Text(
                        widget.nama,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: (){
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                      );
                    }, icon: Icon(Icons.logout, color: Colors.white)
                  )
                ],
              ),
            )
          ),
        )
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  './assets/images/iklan.jpg',
                  fit: BoxFit.cover,
                  height: 150,
                  width: double.infinity,
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: menuButton(
                      icon: Icons.assignment_turned_in_rounded, 
                      label: 'Data Piket', 
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PiketPage(),
                          ),
                        );
                      }
                    ),
                  ),
                   const SizedBox(width: 16),
                  Expanded(
                    child: menuButton(
                      icon: Icons.group_add,
                      label: 'Data Pelanggan',
                      onTap: () {
                         Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => const PelangganPage()));
                      },
                    ),
                  ),
                ],
              ),
                const SizedBox(height: 16),
              menuButton(
                icon: Icons.receipt_long,
                label: 'Barang Masuk/Keluar',
                onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => 
                   BarangPage())
                  );
                },
                isFullWidth: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget menuButton({
      required IconData icon,
      required String label,
      required VoidCallback onTap,
      bool isFullWidth = false,
    }){
      return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 85, 0),
          borderRadius: BorderRadius.circular(16),
        ),
        width: isFullWidth ? double.infinity : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}