import 'package:flutter/material.dart';
import 'package:admin/components/text_field_container.dart';
import 'package:admin/constants.dart';
import 'package:provider/provider.dart';
import 'package:admin/controllers/login_controller.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loginController = Provider.of<LoginController>(context, listen: false);
    return TextFieldContainer(
      child: TextField(
        controller: loginController.usernameLogin,
        onChanged: onChanged,
        cursorColor: primaryColor,
        style: TextStyle(color: secondaryColor, fontSize: 12),
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: primaryColor,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
