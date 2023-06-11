import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/firebase_options.dart';
import 'package:flutter_portfolio/model/achievement.dart';
import 'package:flutter_portfolio/model/blog.dart';
import 'package:flutter_portfolio/model/project.dart';
import 'package:flutter_portfolio/screens/admin_screens/admin_screen.dart';
import 'package:flutter_portfolio/screens/admin_screens/login_screen.dart';
import 'package:flutter_portfolio/screens/main_screen.dart';
import 'package:flutter_portfolio/services/firebase_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        StreamProvider<List<Project>>(
          create: (_) => FirestoreService().getProjects(),
          initialData: const [],
        ),
        StreamProvider<List<Achievement>>(
          create: (_) => FirestoreService().getAchievements(),
          initialData: const [],
        ),
        StreamProvider<List<Blog>>(
          create: (_) => FirestoreService().getBlogs(),
          initialData: const [],
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kishen Lodhia Portfolio",

      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(Typography.whiteHelsinki),
        colorScheme: ColorScheme.light(primary: Colors.blue.shade900),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => MainScreen(),
        '/admin': FirebaseAuth.instance.currentUser != null
            ? (context) => const AdminScreen()
            : (context) => const Login(),
      },
      // home: MainScreen(),
    );
  }
}
