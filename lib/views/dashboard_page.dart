import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/auth_controller.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthController>();

    final Color primaryColor = const Color(0xFF6C63FF); // Ganti ke ungu modern

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),

      // ✅ APPBAR MINIMALIS
      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // ✅ WELCOME CARD MODERN
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [primaryColor, primaryColor.withOpacity(0.7)],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: primaryColor.withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 30, color: Colors.black87),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    "Selamat datang,\n${auth.username}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // ✅ MENU LIST (BEDA TOTAL DARI GRID)
          _menuItem(
            context,
            icon: Icons.calculate,
            title: "Counter",
            route: '/counter',
            color: primaryColor,
          ),

          _menuItem(
            context,
            icon: Icons.person_outline,
            title: "Profile",
            route: '/profile/${auth.username}',
            color: primaryColor,
          ),

          _menuItem(
            context,
            icon: Icons.settings,
            title: "Settings",
            route: '/settings',
            color: primaryColor,
          ),

          const SizedBox(height: 20),

          // ✅ LOGOUT BUTTON TERPISAH (LEBIH JELAS)
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {
              context.read<AuthController>().logout();
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout),
            label: const Text("Logout"),
          ),
        ],
      ),
    );
  }

  // ✅ COMPONENT MENU BARU
  Widget _menuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String route,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }
}
