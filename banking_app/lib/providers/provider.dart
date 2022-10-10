import 'package:banking_app/models/user.dart';
import 'package:flutter/cupertino.dart';

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
}
