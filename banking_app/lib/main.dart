import 'package:banking_app/pages/home_page.dart';
import 'package:banking_app/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart' as pro;

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return pro.MultiProvider(
      providers: [
        pro.ChangeNotifierProvider(
          create: (_) => Provider(),
        )
      ],
      child: MaterialApp(
          home: const HomePage(),
          theme: ThemeData(
            fontFamily: GoogleFonts.roboto().fontFamily,
          )),
    );
  }
}
