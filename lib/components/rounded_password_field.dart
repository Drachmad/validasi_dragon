import 'package:flutter/material.dart';
import 'package:admin/components/text_field_container.dart';
import 'package:admin/constants.dart';
import 'package:provider/provider.dart';
import 'package:admin/controllers/login_controller.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  late bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    var loginController = Provider.of<LoginController>(context, listen: false);
    return TextFieldContainer(
      child: TextField(
        controller: loginController.passwordLogin,
        obscureText: !_passwordVisible,
        onChanged: widget.onChanged,
        cursorColor: primaryColor,
        style: TextStyle(color: secondaryColor, fontSize: 12),
        decoration: InputDecoration(
          hintText: "Password",
          hintStyle: TextStyle(color: Colors.grey),
          icon: Icon(
            Icons.lock,
            color: primaryColor,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: primaryColor,
            ),
            onPressed: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
