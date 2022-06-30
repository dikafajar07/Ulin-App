import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  const Grid({Key key}) : super(key: key);
  // static const route = "/Gridpage";

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        CustomCard(
          title: "Orchid Forest Cikole",
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxVMxuEQAal76zomV-plwZCpcwdniFxi7oNA&usqp=CAU",
          // deskripsi:
          //     "Terletak di Cikole, Lembang, Kabupaten Bandung Barat, Orchid Forest Cikole adalah sebuah tempat wisata di tengah Hutan Pinus yang asri, di mana ribuan jenis anggrek dikembangkan dan dilestarikan",
        ),
        CustomCard(
          title: "Tangkuban Perahu",
          image:
              "https://1.bp.blogspot.com/-S8D1cXTMlWc/WCmBDKsKbKI/AAAAAAAADek/2imuu9GECoYc7nZBJDe5JRFBSPAYxs80gCLcB/s1600/tangkuban%2Bperahu.jpg",
          // deskripsi:
          //     " Tangkuban Perahu atau juga sering disebut TangkGununguban Parahu merupakan salah satu gunung terbesar di dataran Parahyangan. Taman Wisata Alam Gunung Tangkuban Perahu berada di utara kota Lembang, sebelah utara kota Bandung. Udara sejuk, hamparan kebun teh, lembah dan tingginya pohon pinus menemani perjalanan Anda menuju pintu gerbang kawasan Tangkuban Perahu.",
        ),
        CustomCard(
          title: "Gedung Sate",
          image:
              "https://thumbs.dreamstime.com/z/view-gedung-sate-old-historical-building-art-deco-style-bandung-indonesia-view-gedung-sate-old-historical-179360389.jpg",
          // deskripsi:
          // "Gedung Sate merupakan ikon dari kota Bandung yang sangat populer. Gedung yang satu ini bukan hanya ikon kota semata, namun merupakan tempat bersejarah sekaligus kawasan wisata Bandung yang banyak dikunjungi. Bandung memang kota yang tidak pernah sepi dari sorotan wisata. Bukan hanya wisata alam dan kulinernya saja yang terkenal, melainkan wisata sejarahnya juga selalu menarik perhatian.",
        ),
        CustomCard(
          title: "Jalan Braga",
          image:
              "https://upload.wikimedia.org/wikipedia/commons/b/b7/Jl_Braga_Street_Sign_in_Bandung.jpg",
          // deskripsi:
          // "Jalan Braga adalah jalan bersejarah yang dahulunya pernah dikenal sebagai Paris Van Java. Nama dari jalan ini tetap dipertahankan karena, begitu banyak kenangan yang tersirat dari terusan jalan menuju gedung Konferensi Asia Afrika ini.",
        ),
        CustomCard(
          title: "Sanghyang Heuleut",
          image:
              // "https://1.bp.blogspot.com/-S8D1cXTMlWc/WCmBDKsKbKI/AAAAAAAADek/2imuu9GECoYc7nZBJDe5JRFBSPAYxs80gCLcB/s1600/tangkuban%2Bperahu.jpg",
              // deskripsi:
              "Danau Sanghyang Heuleut memiliki air jernih bernuansa kehijauan yang berpadu indah dengan tebing batu berukuran besar di sekelilingnya. Di sela-sela bebatuan, kamu bisa menemukan pepohonan dan rerumputan hijau yang menyegarkan mata. Bebatuannya yang tinggi itu bahkan kerap digunakan sebagai tempat para traveler untuk meloncat indah menuju danau purba tersebut.",
        ),
        CustomCard(
          title: "Floating Market Lembang",
          image:
              "http://sumabeachlifestyle.com/wp-content/uploads/2017/05/Things-to-do-with-kids-bandung-Floating-Market-Lembang.jpg",
          // deskripsi:
          // "Floating Market Lembang merupakan objek wisata yang memadukan alam dan buatan dengan konsep unik dan menarik. Letaknya berada tepat di pusat Kota Lembang sehingga tidak akan sulit untuk mencari fasilitas liburan lain di sekitaran area ini. Keseluruhan area objek wisata ini tidak begitu luas, namun wisatawan dapat menikmati berbagai pengalaman menarik di objek wisata ini.",
        ),
      ],
    );
  }
}

//membuat customcard yang bisa kita panggil setiap kali dibutuhkan
class CustomCard extends StatelessWidget {
  CustomCard({Key key, this.title, this.image}) : super(key: key);

  String title;
  String image;
  // CustomCard({Key key, this.title, this.image, this.deskripsi})
  //     : super(key: key);

  // String title;
  // String image;
  // String deskripsi;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: 500,
            padding: const EdgeInsets.all(5.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.15),
              ),
              color: Colors.white,
              elevation: 10,
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  debugPrint('Card tapped.');
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(
                        child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15.15),
                            topLeft: Radius.circular(15.15),
                          ),
                          image: DecorationImage(
                              image: NetworkImage(
                                image,
                              ),
                              fit: BoxFit.cover)),
                    )),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Expanded(child: Text(title)),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(10),
                    //   child: Expanded(child: Text(deskripsi)),
                    // )
                  ],
                ),
              ),
            )));
  }
}


// class MyCard extends StatelessWidget {
//   const MyCard({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Card(
//         child: InkWell(
//           splashColor: Colors.blue.withAlpha(30),
//           onTap: () {
//             debugPrint('Card tapped.');
//           },
//           child: SizedBox(
//             width: 300,
//             height: 300,
//             child: Column(
//               children: [
//               ]
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
