import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Import controllers
import 'controllers/login_controller.dart';
import 'controllers/register_controller.dart';
import 'controllers/dashboard_controller.dart';
import 'controllers/data_controller.dart';

// Import routes
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
        ChangeNotifierProvider(create: (_) => LoginController()),
        ChangeNotifierProvider(create: (_) => RegisterController()),
        ChangeNotifierProvider(create: (_) => DashboardController()),
        ChangeNotifierProvider(create: (_) => DataController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/login',
        routes: AppRoutes.getRoutes(),
        onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => const NotFoundPage(),
        ),
      ),
    );
  }
}

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: const Center(
        child: Text(
          'Halaman tidak ditemukan!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
