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
}
