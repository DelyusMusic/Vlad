import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_app/pages/registration_page.dart';
import 'package:test_app/service/auth.dart';
import 'package:test_app/service/user.dart';

// ignore: use_key_in_widget_constructors
class AuthPage extends StatefulWidget {
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool visible = false;
  AuthServices auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Authentication",
              textScaleFactor: MediaQuery.textScaleFactorOf(context) * 2.5,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              controller: emailcontroller,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                  color: Colors.white70,
                ),
                prefixIcon: const Icon(
                  Icons.login,
                  color: Colors.white,
                ),
                labelText: "Введите email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              obscureText: !visible,
              controller: passwordcontroller,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                  color: Colors.white70,
                ),
                prefixIcon: const Icon(
                  Icons.password,
                  color: Colors.white,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    visible ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      visible = !visible;
                    });
                  },
                ),
                labelText: "Введите пароль",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.5,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Войти",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
                UserModel? user = await auth.singIn(
                    emailcontroller.text, passwordcontroller.text);
                if (user == null) {
                  Fluttertoast.showToast(msg: "Неправильный ввод данных");
                } else {
                  Fluttertoast.showToast(msg: "Вы успешно вошли в аккаунт");
                }
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              children: [
                const Expanded(
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "ИЛИ",
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: MediaQuery.of(context).textScaleFactor * 8,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Expanded(
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.5,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Нет аккаунта? Создать",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => RegistrationPage(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
