import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/pages/auth_page.dart';
import 'package:test_app/pages/home.dart';
import 'package:test_app/service/user.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserModel? userModel = Provider.of<UserModel?>(context);
    final bool check = userModel != null;

    return check ? HomePage() : AuthPage();
  }
}
