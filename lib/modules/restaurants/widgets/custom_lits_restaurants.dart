
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:learning_b/modules/restaurants/entity/restaurant.dart';
class CuscomListRestaurants extends StatelessWidget {
  const CuscomListRestaurants({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          restaurant.images.isNotEmpty
              ? restaurant.images[0]
              : "https://placehold.co/60x60",
          width: 60,
          height: 60,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.error);
          },
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(restaurant.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(
                width: 300,
                height: 60,
                child: Text(restaurant.description, maxLines: 4, overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ),
        StarRating(
          rating: restaurant.rateing / restaurant.count,
          color: Colors.orange[200],
          borderColor: Colors.grey,
          starCount: 5,
          size: 18,
        ),
      ],
    );
  }
}
