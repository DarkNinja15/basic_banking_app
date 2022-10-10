import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: size.height * 0.4,
              child: Image.asset('assets/welcome.png'),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            GestureDetector(
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: size.height * 0.1,
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.purple,
                    width: size.width * 0.7,
                    child: Text(
                      'View All Coustomers',
                      style: TextStyle(
                        fontFamily: GoogleFonts.ubuntu().fontFamily,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            GestureDetector(
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: size.height * 0.1,
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.purple,
                    width: size.width * 0.7,
                    child: Text(
                      'Add a coustomer',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: GoogleFonts.ubuntu().fontFamily,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
