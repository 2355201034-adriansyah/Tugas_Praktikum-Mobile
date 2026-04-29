import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/auth_controller.dart';
import 'controllers/counter_controller.dart';
import 'views/login_page.dart';
import 'views/dashboard_page.dart';
import 'views/counter_page.dart';
import 'views/profile_page.dart';
import 'views/settings_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterController()),
        ChangeNotifierProvider(create: (_) => AuthController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Kuliah',
      initialRoute: '/login',
      onGenerateRoute: (settings) {
  // Tambahkan baris ini untuk menangani route default
  if (settings.name == '/' || settings.name == '/login') {
    return MaterialPageRoute(builder: (_) => const LoginPage());
  }
  
  if (settings.name == '/dashboard') {
    return MaterialPageRoute(builder: (_) => const DashboardPage());
  }
  
  if (settings.name == '/counter') {
    return MaterialPageRoute(builder: (_) => const CounterPage());
  }

  if (settings.name == '/settings') {
    return MaterialPageRoute(builder: (_) => const SettingsPage());
  }

  if (settings.name!.startsWith('/profile/')) {
    final username = settings.name!.replaceFirst('/profile/', '');
    return MaterialPageRoute(builder: (_) => ProfilePage(username: username));
  }
  
  return null; // Akan memicu error jika route tidak terdaftar
},
    );
  }
}