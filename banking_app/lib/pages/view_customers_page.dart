import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as pro;

import '../providers/provider.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  TextEditingController amtcontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    amtcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customer = pro.Provider.of<Provider>(context).user;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Image.asset('assets/user.png'),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: customer.length,
                itemBuilder: ((context, index) {
                  return Card(
                    color: Colors.purple[300],
                    child: ListTile(
                      title: Text(
                        customer[index].name,
                        style: const TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Balance: ${customer[index].balance.toString()}',
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      trailing: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.pinkAccent,
                            elevation: 1,
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: TextField(
                                            controller: amtcontroller,
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
                                              hintText:
                                                  'Enter ammount to be added',
                                            ),
                                          ),
                                        ),
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            setState(() {
                                              Navigator.of(context).pop();
                                              pro.Provider.of<Provider>(context,
                                                      listen: false)
                                                  .transferMoney(
                                                index,
                                                double.parse(
                                                    amtcontroller.text),
                                                context,
                                              );
                                              amtcontroller.text = "";
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
                          },
                          icon: const Icon(
                            Icons.attach_money_outlined,
                          ),
                          label: const Text('Transfer Money')),
                    ),
                  );
                }))
          ],
        ),
      )),
    );
  }
}
