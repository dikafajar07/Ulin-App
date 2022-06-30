import 'package:flutter/material.dart';

class Orchid extends StatefulWidget {
  const Orchid({Key key}) : super(key: key);
  static const route = "/orchidpage";
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Orchid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: SingleChildScrollView(
          // scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              BodyOrchid(),
              Detail(),
            ],
          ),
        ));
  }
}

class BodyOrchid extends StatelessWidget {
  const BodyOrchid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return Container(
      margin: const EdgeInsets.only(bottom: 5.0),
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
            child: Column(
              children: <Widget>[
                Center(
                    child: Text(
                  'Orchid Forest',
                  style: Theme.of(context).textTheme.headline5.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Detail extends StatelessWidget {
  const Detail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          top: 0,
          child: Container(
            margin: const EdgeInsets.all(20.0),
            // padding: const EdgeInsets.symmetric(horizontal: 20.0),
            height: 300,
            // color: Colors.blue.withOpacity(0.2),
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
            child: Image.asset('assets/images/orrr.jpg'),
          ),
        ),
        Container(
            margin: const EdgeInsets.all(10.0),
            height: 300,
            width: 400,
            child: const Text(
              "Terletak di Cikole, Lembang, Kabupaten Bandung Barat, Orchid Forest Cikole adalah sebuah tempat wisata di tengah Hutan Pinus yang asri, di mana ribuan jenis anggrek dikembangkan dan dilestarikan",
              textAlign: TextAlign.justify,
            ))
      ],
    ));
  }
}
