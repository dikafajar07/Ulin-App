import 'package:flutter/material.dart';
import 'package:mobile_ulin/pages/cardTitle.dart';
import 'package:mobile_ulin/pages/user_profile.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'cardTitle.dart';
import 'recomend.dart';

import '../providers/auth.dart';
import '../providers/users.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key key}) : super(key: key);
  static const route = "/homepage";
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text("Destinasi Wisata",
                  style: Theme.of(context).textTheme.headline5.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold))),
          elevation: 0,
          // actions: <Widget>[
          //   IconButton(
          //     icon: const Icon(Icons.logout),
          //     onPressed: () =>
          //         Provider.of<Authenticate>(context, listen: false).logout(),
          //   )
          // ],
        ),
        drawer: const _buildDrawer(),
        body: SingleChildScrollView(
          // scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Body(),
              // Header(size: size),
              // Grid(),
              CardTitle(title: "Rekomendasi", press: () {}),
              const RecomendPlaces(),
              // CardTitle(title: "Recomended", press: () {}),
            ],
          ),
        ));
  }
}

class _buildDrawer extends StatelessWidget {
  const _buildDrawer({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    final prov = Provider.of<Users>(context);
    return SizedBox(
      //membuat menu drawer
      child: Drawer(
        //membuat list,
        //list digunakan untuk melakukan scrolling jika datanya terlalu panjang
        child: ListView(
          padding: EdgeInsets.zero,
          //di dalam listview ini terdapat beberapa widget drawable
          children: [
            Container(
              color: Colors.blue,
              padding: EdgeInsets.only(
                top: 24 + MediaQuery.of(context).padding.top,
                bottom: 24,
              ),
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 52,
                    backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Dika Fajar Ramadan',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  Text(
                    'dikafajar07@gmail.com',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_sharp),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context, Homepage.route);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.account_box_sharp),
              title: const Text("Profile"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileUser(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              // ignore: void_checks
              onTap: () {
                Provider.of<Authenticate>(context, listen: false).logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0 * 2.5),
      // It will cover 20% of our total height
      height: size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              bottom: 36 + 20.0,
            ),
            height: size.height * 0.2 - 27,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              children: <Widget>[
                Text('Play More Than Work!',
                    style: Theme.of(context).textTheme.titleLarge.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        )),
                const Spacer(),
                // Image.asset("assets/images/logo.png")
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.blue.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: Colors.blue.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        // surffix isn't working properly  with SVG
                        // thats why we use row
                        // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                      ),
                    ),
                  ),
                  SvgPicture.asset("assets/icons/search.svg"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
