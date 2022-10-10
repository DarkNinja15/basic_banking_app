import 'package:banking_app/pages/info_page.dart';
import 'package:banking_app/pages/view_customers_page.dart';
import 'package:banking_app/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart' as pro;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController amtcontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    namecontroller.dispose();
    amtcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.4,
                child: Image.asset('assets/welcome.png'),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ViewPage()));
                },
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
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: Column(
                              children: [
                                TextField(
                                  controller: namecontroller,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter name of customer',
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                TextField(
                                  controller: amtcontroller,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      hintText: 'Enter balance'),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    pro.Provider.of<Provider>(context,
                                            listen: false)
                                        .addCustomer(
                                      namecontroller.text,
                                      double.parse(amtcontroller.text),
                                    );
                                    amtcontroller.text = "";
                                    namecontroller.text = "";
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.purple,
                                  ),
                                  icon: const Icon(Icons.person_add),
                                  label: const Text('Add Customer'),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurpleAccent,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => InfoPage(),
              ),
            );
          },
          child: const Icon(
            Icons.person,
          ),
        ),
      ),
    );
  }
}
