import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';

// ignore: unnecessary_const
const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

//login page
class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

//Sign up user
class _LoginPageState extends State<LoginPage> {
  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String> _authUserSignUp(SignupData data) {
    return Future.delayed(loginTime).then((_) async {
      try {
        await Provider.of<Authenticate>(context, listen: false)
            .signup(data.name, data.password);
      } catch (err) {
        // ignore: avoid_print
        print(err);
        return err.toString();
      }
      return null;
    });
  }

//login user
  Future<String> _authUserLogin(LoginData data) {
    return Future.delayed(loginTime).then((_) async {
      try {
        await Provider.of<Authenticate>(context, listen: false)
            .login(data.name, data.password);
      } catch (err) {
        // ignore: avoid_print
        print(err);
        return err.toString();
      }
      return null;
    });
  }

//recover psswd
  Future<String> _recoverPassword(String name) {
    // ignore: avoid_print
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: '',
      logo: 'assets/images/ulin.png',
      onLogin: _authUserLogin,
      onSignup: _authUserSignUp,
      onSubmitAnimationCompleted: () {
        Provider.of<Authenticate>(context, listen: false).tempData();
        // Navigator.pushNamed(context, Homepage.route);
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
