import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant.dart';

class RestaurantDetailPage extends StatefulWidget {
  static const routeName = '/restaurant_detail';

  final Restaurant restaurant;

  const RestaurantDetailPage({super.key, required this.restaurant});

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  bool isReadMore = false;
  int maxLine = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restaurant.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: widget.restaurant.pictureId,
              child: Image.network(widget.restaurant.pictureId)
            ),
            Padding(padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Row(
                        children: [
                          const Icon(
                            Icons.location_pin,
                            color: Colors.red,
                            size: 15,
                          ),
                          const SizedBox(width: 5),
                          Text(widget.restaurant.city)
                        ]
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        ),
                        const SizedBox(width: 5),
                        Text(widget.restaurant.rating.toString())
                      ],
                    )
                  ],
                ),
                const Divider(color: Colors.grey),
                const Text('Deskripsi:'),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.restaurant.description,
                  maxLines: maxLine,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isReadMore = !isReadMore;

                            if (!isReadMore) {
                              maxLine = 2;
                            } else {
                              maxLine = 50;
                            }
                          });
                        },
                        child: Text(isReadMore ? 'Read less' : 'Read more')
                    ),
                  )
                ),
                const Divider(color: Colors.grey,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Menu:'),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Foods:'),
                        Text(
                          widget.restaurant.menus.foods
                              .map((food) => food.name)
                              .toString(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Drinks:'),
                        Text(
                          widget.restaurant.menus.drinks
                              .map((drink) => drink.name)
                              .toString(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}
