import 'package:flutter/material.dart';
import 'package:wallpaper_app/controllers/api_controller.dart';
import 'package:wallpaper_app/utilse/routes_utilse.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/views/screen/home_page.dart';
import 'package:wallpaper_app/views/screen/info_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ApiController(),
        ),
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
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        AllRoutes.homePage: (context) => home_page(),
        AllRoutes.wallPaperInfoPage: (context) => wallpaper_Info_Page(),
      },
    );
  }
}
