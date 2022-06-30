import 'package:flutter/material.dart';
import 'package:mobile_ulin/detailPages/Braga.dart';
import 'package:mobile_ulin/detailPages/FlotMarket.dart';
import 'package:mobile_ulin/detailPages/Heuleut.dart';
import 'package:mobile_ulin/detailPages/Tangkuban.dart';
import 'package:mobile_ulin/detailPages/gdSate.dart';

import '../detailPages/orchid.dart';
// import 'package:plant_app/screens/details/details_screen.dart';

class RecomendPlaces extends StatelessWidget {
  const RecomendPlaces({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
          child: Wrap(
        children: <Widget>[
          RecomendPlaceCard(
            image: 'assets/images/orrr.jpg',
            title: "Orchid Forest",
            country: "Bandung",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Orchid(),
                ),
              );
            },
          ),
          RecomendPlaceCard(
            image: 'assets/images/gdsate.png',
            title: "Gedung Sate",
            country: "Bandung",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GdSate(),
                ),
              );
            },
          ),
          RecomendPlaceCard(
            image: 'assets/images/tangkuban.jpeg',
            title: "Tangkuban Parahu",
            country: "Bandung",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Tangkuban(),
                ),
              );
            },
          ),
          RecomendPlaceCard(
            image: 'assets/images/braga.jpg',
            title: "Jalan Braga",
            country: "Bandung",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Braga(),
                ),
              );
            },
          ),
          RecomendPlaceCard(
            image: 'assets/images/sayangheuleut.jpg',
            title: "Sayang Heuleut",
            country: "Bandung",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Heuleut(),
                ),
              );
            },
          ),
          RecomendPlaceCard(
            image: 'assets/images/floatmarket.jpg',
            title: "Floating Market",
            country: "Lembang",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FloatMarket(),
                ),
              );
            },
          ),
        ],
      )),
    );
  }
}

class RecomendPlaceCard extends StatelessWidget {
  const RecomendPlaceCard({
    Key key,
    this.image,
    this.title,
    this.country,
    this.press,
  }) : super(key: key);

  final String image, title, country;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(
        left: 20.0,
        top: 20.0 / 2,
        bottom: 20.0 * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(image),
          GestureDetector(
              child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: press,
            child: Container(
              padding: const EdgeInsets.all(20.0 / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
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
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "$title\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                        TextSpan(
                          text: "$country".toUpperCase(),
                          style: TextStyle(
                            color: Colors.blue.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
