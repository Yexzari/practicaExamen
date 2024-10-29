import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import '../entity/restaurant.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Detail extends StatelessWidget {
  const Detail({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
                width: 300,
                height: 64,
                child:
                CarouselSlider(
                                options: CarouselOptions(),
                                items: restaurant.images
                                    .map((item) => Container(
                                        child: Center(
                                            child:
                                                Image.network(item, fit: BoxFit.cover, width: 60,height: 60)),
                                        ))
                                    .toList(),
                            )
                ),
            StarRating(
                rating: restaurant.rateing / restaurant.count,
                color: Colors.orange[200],
                borderColor: Colors.grey,
                starCount: 5,
                size: 18,
            ),
            SizedBox(
                height: 60,
                child: Text(restaurant.description, maxLines: 4, overflow: TextOverflow.ellipsis),
              ),   
           
          ],
        ),
      ),
    );
  }
}
