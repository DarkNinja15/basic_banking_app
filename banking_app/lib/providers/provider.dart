import 'package:banking_app/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Provider with ChangeNotifier {
  final List<User> _customer = [
    User(id: "1", name: "User 1", balance: 1000000.00),
  ];

  List<User> get user => _customer;

  addMoneyInuserone(double amt) {
    _customer[0].balance += amt;
    notifyListeners();
  }

  addCustomer(String name, double amt) {
    _customer.add(User(
      name: name,
      balance: amt,
      id: _customer.length.toString(),
    ));
    print('length = ${_customer.length}');
    notifyListeners();
  }

  transferMoney(int index, double amt, BuildContext context) {
    if (_customer[0].balance >= amt) {
      _customer[index].balance += amt;
      _customer[0].balance -= amt;
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
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              content: Text("Money Transfred"),
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              title: Text("Failed"),
              titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
              backgroundColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              content: Text("Insufficient Balance"),
            );
          });
    }
    notifyListeners();
  }
}
