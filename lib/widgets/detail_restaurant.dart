import 'package:flutter/material.dart';
import 'package:flutter_dua/theme/theme.dart';
import 'package:flutter_dua/data/restaurant_detail.dart';

class DetailRestaurant extends StatelessWidget {
  final Restaurant restaurant;
  final String id;

  const DetailRestaurant({Key? key, required this.id, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[200],
      appBar: AppBar(
        title: Text(
          restaurant.name,
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[800],
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Image.network(
            'https://restaurant-api.dicoding.dev/images/medium/${restaurant.pictureId}',
            width: MediaQuery.of(context).size.width,
            height: 250,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurant.name,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.room,
                              color: Colors.blue,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${restaurant.address}, ${restaurant.city}',
                              style: Theme.of(context).textTheme.subtitle2,
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          restaurant.rating.toString(),
                          style: Theme.of(context).textTheme.subtitle2,
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  restaurant.description,
                  style: Theme.of(context).textTheme.caption,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Foods',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: restaurant.menus.foods.map((item) {
                      return Container(
                        margin: const EdgeInsets.only(right: 10, bottom: 20),
                        height: 150,
                        width: 120,
                        decoration: BoxDecoration(
                            color: const Color(0xffb2dfdb),
                            borderRadius: BorderRadius.circular(18)),
                        child: Center(
                            child: Text(item.name,
                                style: Theme.of(context).textTheme.subtitle2,
                                textAlign: TextAlign.center)),
                      );
                    }).toList(),
                  ),
                ),
                Text(
                  'Drinks',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: restaurant.menus.drinks.map((item) {
                      return Container(
                        margin: const EdgeInsets.only(right: 10, bottom: 20),
                        height: 150,
                        width: 120,
                        decoration: BoxDecoration(
                            color: const Color(0xffb2dfdb),
                            borderRadius: BorderRadius.circular(18)),
                        child: Center(
                            child: Text(item.name,
                                style: Theme.of(context).textTheme.subtitle2,
                                textAlign: TextAlign.center)),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Comment',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    TextButton(
                        child: const Text('Comment'),
                        style: TextButton.styleFrom(
                            primary: white,
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        onPressed: () {}),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: restaurant.customerReviews.map((item) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: const Color(0xffb2dfdb),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(-4.0, -4.0),
                                blurRadius: 15.0,
                                spreadRadius: 1.0),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.name,
                                  style: Theme.of(context).textTheme.headline6),
                              const SizedBox(height: 5),
                              Text(item.date,
                                  style: Theme.of(context).textTheme.subtitle1),
                              const SizedBox(height: 8),
                              Text(
                                item.review,
                                style: Theme.of(context).textTheme.caption,
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
