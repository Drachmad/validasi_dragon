import 'package:admin/components/loading_bar.dart';
import 'package:admin/screens/login/login_screen.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:admin/Screens/Login/components/background.dart';
import 'package:admin/components/rounded_button.dart';
import 'package:admin/components/rounded_input_field.dart';
import 'package:admin/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:admin/controllers/login_controller.dart';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);

  final GlobalKey<State> _LoaderDialog = new GlobalKey<State>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var loginController = Provider.of<LoginController>(context, listen: false);
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/logo2.png",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Username",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                LoaderDialog.showLoaderDialog(context);
                loginController.getLogin().then((value) {
                  print(value);
                  Navigator.pop(context);
                  if (value != null) {
                    if (value) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => MainScreen()));
                    }
                  }
                });
              },
            ),
            SizedBox(height: size.height * 0.03),
            // AlreadyHaveAnAccountCheck(
            //   press: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return SignUpScreen();
            //         },
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
