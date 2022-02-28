import 'package:admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:admin/models/model_login.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginController with ChangeNotifier {
  bool mode_login = true;
  TextEditingController usernameLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();
  static String nama_staff = "";
  static String email_staff = "";
  static String divisi = "";
  static String dr = "";
  int ROLE = 1;

  void initData() async {
    mode_login = true;
    usernameLogin.clear();
    passwordLogin.clear();
  }

  Future<bool> getLogin() async {
    try {
      if (usernameLogin.text.isNotEmpty) {
        if (passwordLogin.text.isNotEmpty) {
          List data_user = await model_login()
              .select_data_login(usernameLogin.text, passwordLogin.text);
          print(data_user);
          if (data_user.length > 0) {
            var obj_data = data_user[0];
            nama_staff = obj_data['USERNAME'].toString();
            divisi = obj_data['USERHP'].toString();

            Fluttertoast.showToast(
                msg: "Selamat Datang $nama_staff",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: secondaryColor,
                textColor: Colors.white,
                fontSize: 16.0);

            return true;
          } else {
            return false;
          }
        } else {
          Fluttertoast.showToast(
              msg: "Username atau Password Salah",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          return false;
        }
      } else {
        Fluttertoast.showToast(
            msg: "Username Tidak Ditemukan",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        return false;
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Username atau Password Salah",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return false;
    }
  }
}
