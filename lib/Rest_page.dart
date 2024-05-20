import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TasteRestaurantsPage extends StatefulWidget {
  const TasteRestaurantsPage({super.key});

  @override
  State<TasteRestaurantsPage> createState() => _TasteRestaurantsPageState();
}

class _TasteRestaurantsPageState extends State<TasteRestaurantsPage> {
  Icon heartIcon = const Icon(Icons.favorite_border_outlined);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            padding: const EdgeInsets.all(15),
            alignment: Alignment.topLeft,
            width: double.infinity,
            height: 220,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://t4.ftcdn.net/jpg/02/94/26/33/360_F_294263329_1IgvqNgDbhmQNgDxkhlW433uOFuIDar4.jpg"))),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 30, top: 30),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("YOU CAN REALLY",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white)),
                          Text(
                            "TASTE",
                            style: GoogleFonts.tangerine(
                              color: const Color.fromARGB(255, 248, 95, 106),
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(" THE DELIVERY",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white))
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )),
        SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 200),
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                      left: 30, right: 30, top: 30, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(15)),
                  height: 70,
                  width: double.infinity,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.info,
                          color: Colors.white,
                        ),
                        const Text(
                          "Complete Your Order",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    transitionDuration:
                                        const Duration(milliseconds: 800),
                                    transitionsBuilder: (_, a, __, c) =>
                                        FadeTransition(opacity: a, child: c),
                                    pageBuilder: (_, __, ___) =>
                                        const Material()));
                          },
                          icon: const Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          ),
                        )
                      ]),
                ),
              ]),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 320),
          child: SingleChildScrollView(
            child: Column(
              children: [
                resturantContainer(
                    "Lucca Steakhouse",
                    "Stake",
                    "4.5",
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRWIKzKVN5N2g9Zzj2nDy5LGtQ-YvFUjN4onfDyEeh2Q&s",
                    "Amman"),
                resturantContainer(
                    "Jubran",
                    "Middle Eastern",
                    "4.8",
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGZE3VBB4cpgv1zTOMPKA-32TIgm2RnOt5nvpkOXlGJw&s",
                    "Amman"),
                resturantContainer(
                    "La Capitale Restaurant",
                    "French, European",
                    "4",
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvxwiFnkY1PpsxK-J-9M2KeGx4XKIR6r3c6XFQv_0m0g&s",
                    "Amman"),
                resturantContainer(
                    "Bourj Al Hamam",
                    "Lebanese",
                    "4.4",
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5TrYehlBozlrBXsxn18r7oaeAk0E8Da-pV4fmeuKAEA&s",
                    "Amman"),
                resturantContainer(
                    "Salt Steakhouse",
                    "Steakhouse",
                    "3.7",
                    "https://plus.unsplash.com/premium_photo-1670984940113-f3aa1cd1309a?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cmVzdGF1cmFudHN8ZW58MHx8MHx8fDA%3D",
                    "Amman"),
                resturantContainer(
                    "Tsuki Asian",
                    "Asian",
                    "4.9",
                    "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmVzdGF1cmFudHxlbnwwfHwwfHx8MA%3D%3D",
                    "Amman")
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container resturantContainer(String name, String type, String rate,
      String imageLink, String location) {
    return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(width: 0.2, color: Colors.grey),
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 3, offset: Offset(2, 4))
            ],
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(20)),
        height: 120,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(2, 2),
                        color: Color.fromARGB(255, 161, 158, 158),
                        blurRadius: 3)
                  ],
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(imageLink))),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                Text(type),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [const Icon(Icons.location_on), Text(location)],
                    ),
                    Row(
                      children: [Icon(Icons.star), Text(rate)],
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )),
              ],
            )
          ],
        ));
  }
}
