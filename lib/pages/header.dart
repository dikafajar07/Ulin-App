import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
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
            // child: Row(
            //   children: <Widget>[
            //       Text(
            //         'Destinasi Wisata',
            //         style: Theme.of(context).textTheme.headline5.copyWith(
            //             color: Colors.white, fontWeight: FontWeight.bold),
            //       ),
            //       const Spacer(),
            //       // Image.asset("assets/images/logo.png")
            //     ],
            //   ),
            // ),
            // Positioned(
            //   bottom: 0,
            //   left: 0,
            //   right: 0,
            //   child: Container(
            //     alignment: Alignment.center,
            //     margin: const EdgeInsets.symmetric(horizontal: 20.0),
            //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
            //     height: 54,
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(20),
            //       boxShadow: [
            //         BoxShadow(
            //           offset: const Offset(0, 10),
            //           blurRadius: 50,
            //           color: Colors.blue.withOpacity(0.23),
            //         ),
            //       ],
            //     ),
            //     child: Row(
            //       children: <Widget>[
            //         Expanded(
            //           child: TextField(
            //             onChanged: (value) {},
            //             decoration: InputDecoration(
            //               hintText: "Search",
            //               hintStyle: TextStyle(
            //                 color: Colors.blue.withOpacity(0.5),
            //               ),
            //               enabledBorder: InputBorder.none,
            //               focusedBorder: InputBorder.none,
            //               // surffix isn't working properly  with SVG
            //               // thats why we use row
            //               // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
            //             ),
            //           ),
            //         ),
            //         SvgPicture.asset("assets/icons/search.svg"),
            //       ],
            //     ),
            // ),
          ),
        ],
      ),
    );
  }
}
