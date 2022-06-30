import 'package:flutter/material.dart';
import 'package:mobile_ulin/detailPages/Braga.dart';
import 'package:mobile_ulin/detailPages/FlotMarket.dart';
import 'package:mobile_ulin/detailPages/Heuleut.dart';
import 'package:mobile_ulin/detailPages/Tangkuban.dart';
import 'package:mobile_ulin/detailPages/gdSate.dart';
import 'package:mobile_ulin/detailPages/orchid.dart';
import 'package:mobile_ulin/pages/edit_profile.dart';
import 'package:mobile_ulin/pages/user_profile.dart';
import 'package:mobile_ulin/providers/users.dart';
import 'package:provider/provider.dart';
import './providers/auth.dart';
import './pages/auth_page.dart';
import 'pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Authenticate(),
        ),
        ChangeNotifierProxyProvider<Authenticate, Users>(
          create: (context) => Users(),
          update: (context, auth, users) =>
              users..updateData(auth.token, auth.userId),
        ),
      ],
      builder: (context, child) => Consumer<Authenticate>(
        builder: (context, auth, child) => MaterialApp(
          title: 'Ulin App',
          theme: ThemeData(
            textTheme: const TextTheme(
              headline3: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 45.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(
                fontFamily: 'OpenSans',
              ),
              subtitle1: TextStyle(fontFamily: 'NotoSans'),
              bodyText2: TextStyle(fontFamily: 'NotoSans'),
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: auth.isAuth
              ? const Homepage()
              : FutureBuilder(
                  future: auth.autoLogin(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Scaffold(
                        body: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return const LoginPage();
                  },
                ),
          routes: {
            Homepage.route: (ctx) => const Homepage(),
            Orchid.route: (ctx) => const Orchid(),
            Tangkuban.route: (ctx) => const Tangkuban(),
            Heuleut.route: (ctx) => const Heuleut(),
            FloatMarket.route: (ctx) => const FloatMarket(),
            Braga.route: (ctx) => const Braga(),
            GdSate.route: (ctx) => const GdSate(),
            ProfileUser.route: (ctx) => ProfileUser(),
            EditProfilePage.route: (ctx) => EditProfilePage(),
          },
        ),
      ),
    );
  }
}
