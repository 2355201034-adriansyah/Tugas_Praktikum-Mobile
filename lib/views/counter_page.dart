import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/counter_controller.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProv = context.watch<CounterController>();
    
    // Variabel Warna Maroon
    final Color primaryMaroon = const Color(0xFF800000);
    final Color darkMaroon = const Color(0xFF4A0000);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text("Counter", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: primaryMaroon,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container Angka Counter
            Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: primaryMaroon.withOpacity(0.1),
                    blurRadius: 30,
                    spreadRadius: 10,
                  ),
                ],
                border: Border.all(color: primaryMaroon.withOpacity(0.2), width: 2),
              ),
              child: Text(
                "${counterProv.counter}",
                style: TextStyle(
                  fontSize: 80, 
                  fontWeight: FontWeight.w900, 
                  color: darkMaroon,
                ),
              ),
            ),
            const SizedBox(height: 50),
            
            // Tombol Aksi
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _counterButton(
                  icon: Icons.remove_rounded,
                  color: Colors.grey[400]!,
                  onPressed: () => counterProv.decrement(),
                ),
                const SizedBox(width: 30),
                _counterButton(
                  icon: Icons.add_rounded,
                  color: primaryMaroon,
                  onPressed: () => counterProv.increment(),
                ),
              ],
            ),
            const SizedBox(height: 40),
            
            // Teks Keterangan Tambahan
            Text(
              "Ketuk tombol untuk mengubah nilai",
              style: TextStyle(color: Colors.grey[600], fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Helper untuk Tombol Bulat
  Widget _counterButton({required IconData icon, required Color color, required VoidCallback onPressed}) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: IconButton(
        iconSize: 35,
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
        padding: const EdgeInsets.all(15),
      ),
    );
  }
}