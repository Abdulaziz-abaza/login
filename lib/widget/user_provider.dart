// // import 'dart:io';

// // import 'package:flutter/material.dart';

// // class ProfileProvider extends ChangeNotifier {
// //   String _firstName = '';
// //   String _secondName = '';
// //   File? _image;

// //   String get firstName => _firstName;
// //   String get secondName => _secondName;
// //   File? get image => _image;

// //   void updateFirstName(String firstName) {
// //     _firstName = firstName + " " + _secondName;
// //     notifyListeners();
// //   }

// //   void updateSecondName(String secondName) {
// //     _secondName = secondName;
// //     notifyListeners();
// //   }

// //   void updateImage(File? image) {
// //     _image = image;
// //     notifyListeners();
// //   }
// // }
// import 'dart:io';
// import 'package:flutter/material.dart';

// class ProfileProvider extends ChangeNotifier {
//   String _firstName = '';
//   String _secondName = '';
//   String _email = '';
//   File? _image;

//   String get firstName => _firstName;
//   String get secondName => _secondName;
//   String get email => _email;
//   File? get image => _image;

//   void updateFirstName(String firstName) {
//     _firstName = firstName;
//     notifyListeners();
//   }

//   void updateSecondName(String secondName) {
//     _secondName = secondName;
//     notifyListeners();
//   }

//   void updateEmail(String email) {
//     _email = email;
//     notifyListeners();
//   }

//   void updateImage(File? image) {
//     _image = image;
//     notifyListeners();
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider extends ChangeNotifier {
  String _firstName = '';
  String _secondName = '';
  String _email = '';
  String _password = '';
  File? _image;

  String _newemail = '';
  String _newpassword = '';

  String get firstName => _firstName;
  String get secondName => _secondName;
  String get email => _email;
  String get password => _password;
  File? get image => _image;
  String get newemail => _newemail;
  String get newpassword => _newpassword;

  void updateFirstName(String firstName) {
    _firstName = firstName;
    notifyListeners();
  }

  void updateSecondName(String secondName) {
    _secondName = secondName;
    notifyListeners();
  }

  void updateEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void updatePassword(String password) {
    _password = password;
    notifyListeners();
  }

  void updateImage(File? image) {
    _image = image;
    notifyListeners();
  }

  Future<void> saveProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('firstName', _firstName);
    await prefs.setString('secondName', _secondName);
    await prefs.setString('email', _email);
    await prefs.setString('password', _password);
    //  await prefs.setString('password', _newpassword);
    //  await prefs.setString('email', _newemail);

    notifyListeners();
  }

  Future<void> loadProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _firstName = prefs.getString('firstName') ?? '';
    _secondName = prefs.getString('secondName') ?? '';
    _email = prefs.getString('email') ?? '';
    _password = prefs.getString('password') ?? '';
    _newpassword = prefs.getString('password') ?? '';
    _newemail = prefs.getString('email') ?? '';

    notifyListeners();
  }
}
