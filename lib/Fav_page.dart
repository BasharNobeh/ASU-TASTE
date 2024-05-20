import 'package:flutter/material.dart';

class TasteFavoritesPage extends StatefulWidget {
  const TasteFavoritesPage({super.key});

  @override
  State<TasteFavoritesPage> createState() => _TasteFavoritesPageState();
}

class _TasteFavoritesPageState extends State<TasteFavoritesPage> {
  Icon heartIcon = const Icon(Icons.favorite_border_outlined);
  @override
  Widget build(BuildContext context) {
 ;

    return SingleChildScrollView(
      child: Column(
        children: [
          CreateNewMeal("Shawerma",
              "https://media.istockphoto.com/id/1421688556/photo/beef-shawarma-on-a-dark-background-shawarma-with-beef-in-pita-bread.jpg?s=612x612&w=0&k=20&c=wAhnmKwTKhukglXVPQBR2FI0w4h07mwpgz0QSTY99e0="),
          CreateNewMeal("Burger",
              "https://www.shutterstock.com/image-photo/burger-tomateoes-lettuce-pickles-on-600nw-2309539129.jpg"),
          CreateNewMeal("Mansaf",
              "https://amiraspantry.com/wp-content/uploads/2021/04/mansaf-I.jpg"),
          CreateNewMeal("Pizza",
              "https://images.ctfassets.net/nw5k25xfqsik/64VwvKFqxMWQORE10Tn8pY/200c0538099dc4d1cf62fd07ce59c2af/20220211142754-margherita-9920.jpg"),
          CreateNewMeal("Spaghetti",
              "https://www.bowlofdelicious.com/wp-content/uploads/2023/07/one-pot-spaghetti-with-meat-sauce-square.jpg")
        ],
      ),
    );
  }

  Stack CreateNewMeal(String name, String ImageURL) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 20,
          ),
        ),
        Container(
            height: 200,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                border: Border.all(width: 0.2, color: Colors.grey),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 3, offset: Offset(2, 4))
                ],
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(ImageURL.toString())),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 65,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 3),
                        child: Text(
                          name,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
