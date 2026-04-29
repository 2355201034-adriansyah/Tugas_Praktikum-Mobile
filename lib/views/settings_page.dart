import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/auth_controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Variabel Warna Maroon
    final Color primaryMaroon = const Color(0xFF800000);
    final Color darkMaroon = const Color(0xFF4A0000);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Background abu-abu sangat muda
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: primaryMaroon,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          // Section Akun
          _buildSectionHeader("Akun", primaryMaroon),
          _buildSettingTile(
            icon: Icons.person_outline_rounded,
            title: "Edit Profil",
            onTap: () {},
          ),
          _buildSettingTile(
            icon: Icons.lock_outline_rounded,
            title: "Ubah Password",
            onPressed: () {},
          ),
          
          const SizedBox(height: 10),
          const Divider(thickness: 1, indent: 20, endIndent: 20),
          
          // Section Aplikasi
          _buildSectionHeader("Aplikasi", primaryMaroon),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SwitchListTile(
              secondary: Icon(Icons.notifications_none_rounded, color: primaryMaroon),
              title: const Text("Notifikasi", style: TextStyle(fontWeight: FontWeight.w500)),
              activeColor: primaryMaroon,
              value: true,
              onChanged: (bool value) {},
            ),
          ),
          _buildSettingTile(
            icon: Icons.language_rounded,
            title: "Bahasa",
            subtitle: "Indonesia",
            onTap: () {},
          ),
          
          const SizedBox(height: 10),
          const Divider(thickness: 1, indent: 20, endIndent: 20),
          
          // Section Keluar
          const SizedBox(height: 10),
          _buildLogoutTile(context),
          
          // App Version Info
          const SizedBox(height: 30),
          const Center(
            child: Text(
              "App Version 1.0.0",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  // Widget Helper untuk Header Section
  Widget _buildSectionHeader(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: color,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  // Widget Helper untuk List Tile standar
  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    String? subtitle,
    VoidCallback? onTap,
    VoidCallback? onPressed,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      leading: Icon(icon, color: Colors.black87),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(Icons.chevron_right_rounded, color: Colors.grey),
      onTap: onTap,
    );
  }

  // Widget Helper khusus Logout agar mencolok
  Widget _buildLogoutTile(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.logout_rounded, color: Colors.red),
      ),
      title: const Text(
        "Keluar",
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
      onTap: () {
        context.read<AuthController>().logout();
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/login',
          (route) => false,
        );
      },
    );
  }
}