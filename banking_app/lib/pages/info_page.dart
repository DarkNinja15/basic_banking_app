import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double amt = 100000000.00;
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.25,
            child: Container(
              margin: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1665238076980-47731fc833b2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyOXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
                  ),
                ),
              ),
            ),
          ),
          Text(
            'User 1',
            style: TextStyle(
                fontFamily: GoogleFonts.laila().fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          const Divider(),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: size.height * 0.1,
              child: Container(
                  alignment: Alignment.center,
                  color: Colors.purple,
                  width: size.width * 0.7,
                  child: Text(
                    'Balance = $amt',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.lato().fontFamily,
                        color: Colors.white),
                  )),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.monetization_on,
                color: Colors.purple,
              ),
              label: const Text(
                'Add Money',
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
              // style: ,
            ),
          )
        ],
      )),
    );
  }
}
