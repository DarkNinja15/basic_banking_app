import 'package:banking_app/models/user.dart';
import 'package:banking_app/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart' as pro;

class InfoPage extends StatefulWidget {
  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  TextEditingController amtcontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    amtcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customer = pro.Provider.of<Provider>(context);
    final size = MediaQuery.of(context).size;

    add_remove_Money(double amt) {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: amtcontroller,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Enter ammount to be added',
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        pro.Provider.of<Provider>(context, listen: false)
                            .addMoneyInuserone(
                                double.parse(amtcontroller.text));
                        amtcontroller.text = "";
                        Navigator.of(context).pop();
                      });
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AlertDialog(
                              title: Text("Success"),
                              titleTextStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 20),
                              backgroundColor: Colors.greenAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              content: Text("Money Added"),
                            );
                          });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purpleAccent,
                    ),
                    icon: const Icon(Icons.attach_money),
                    label: const Text('ADD'),
                  )
                ],
              ),
            );
          });
    }

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
                    'Balance = ${(customer.user)[0].balance}',
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
              onPressed: () {
                add_remove_Money(
                  (customer.user)[0].balance,
                );
              },
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
