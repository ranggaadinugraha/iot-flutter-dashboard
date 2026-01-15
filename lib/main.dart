import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Controllers
import 'controllers/login_controller.dart';
import 'controllers/register_controller.dart';
import 'controllers/dashboard_controller.dart';
import 'controllers/data_controller.dart';

// Pages
import 'pages/login_page.dart';

// Routes
import 'routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginController>(
          create: (_) => LoginController(),
        ),
        ChangeNotifierProvider<RegisterController>(
          create: (_) => RegisterController(),
        ),
        ChangeNotifierProvider<DashboardController>(
          create: (_) => DashboardController(),
        ),
        ChangeNotifierProvider<DataController>(
          create: (_) => DataController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'IoT Flutter Dashboard',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),

        // 🔥 PENTING UNTUK WEB (HINDARI initialRoute)
        home: const LoginPage(),

        // Routing tetap boleh dipakai
        routes: AppRoutes.getRoutes(),

        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (_) => const NotFoundPage(),
          );
        },
      ),
    );
  }
}

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('404')),
      body: const Center(
        child: Text(
          'Halaman tidak ditemukan',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
