import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CenterPart extends StatelessWidget {
  final TextEditingController? email;
  final bool obscureText;
  final TextEditingController? password;
  final Widget icon;
  final void Function()? onPressed;
  CenterPart({
    required this.obscureText,
    required this.icon,
    required this.email,
    required this.password,
    required this.onPressed,
    Key? key,  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: email,
          decoration: InputDecoration(
            hintText: "Email",
          ),
        ),
        TextFormField(
          obscureText: obscureText,
          controller: password,
          decoration: InputDecoration(
            hintText: "Password",
            suffixIcon: IconButton(onPressed: onPressed, icon: icon),
          ),
        ),
      ],
    );
  }
}
