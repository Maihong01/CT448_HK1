import 'package:appfood/page/login/components/center_part.dart';
import 'package:appfood/page/login/components/end_part.dart';
import 'package:appfood/page/login/components/top_part.dart';
import 'package:appfood/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import 'components/login_auth_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    LoginAuthProvider loginAuthProvider =
        Provider.of<LoginAuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //top part(phan tren)

            const TopPart(),
            //center part(trung tam)

            CenterPart(
              email: email,
              password: password,
              obscureText: visible,
              onPressed: () {
                setState(() {
                  visible != visible;
                });
              },
              icon: Icon(
                visible ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            //end part

            EndPart(
              loading: loginAuthProvider.loading,
              onPressed: () {
                loginAuthProvider.loginPageVaidation(
                  emailAdress: email,
                  password: password,
                  context: context,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
