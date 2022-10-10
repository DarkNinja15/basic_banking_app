import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as pro;

import '../providers/provider.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    final customer = pro.Provider.of<Provider>(context).user;
    return Scaffold(
      body: SafeArea(
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
                        onPressed: () {},
                        icon: const Icon(
                          Icons.attach_money_outlined,
                        ),
                        label: const Text('Transfer Money')),
                  ),
                );
              }))
        ],
      )),
    );
  }
}
