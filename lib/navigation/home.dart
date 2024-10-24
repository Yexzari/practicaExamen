import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:learning_b/modules/restaurants/entity/restaurant.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

final db = FirebaseFirestore.instance;

class _homeState extends State<home> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  bool _isLoading = true;
  List<Restaurant> restaurants = [];

  Future<void> fetchData() async {
    try {
      QuerySnapshot event = await db.collection("restaurants").get();
      for (var doc in event.docs) {
        final data = doc.data() as Map<String, dynamic>;
        final Restaurant restaurant = Restaurant(
          data["name"],
          data["description"],
          List<String>.from(data["images"]),
          (data["rating"] is double)
              ? data["rating"]
              : double.tryParse(data["rating"].toString()) ?? 0.0,
          data["count"],
        );
        print(restaurant);
        restaurants.add(restaurant);
      }
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      print("Error al obtener datos: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    } else {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Inicio'),
          ),
          body: Column(
            children: [
              Row(
                children: [
                  Image.network(
                    restaurants[0].images.isNotEmpty
                        ? restaurants[0].images[0]
                        : "https://placehold.co/60x60",
                    width: 60,
                    height: 60,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                          Icons.error); // Muestra un icono de error
                    },
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    children: [
                      Text(restaurants[0].name),
                      SizedBox(
                        width: 200,
                        height: 100,
                        child: Text(restaurants[0].description),
                      ),
                    ],
                  ),
                  const Spacer(),
                  StarRating(
                    rating: restaurants[0].rateing/restaurants[0].count,
                    color: Colors.orange[200],
                    borderColor: Colors.grey,
                    starCount: 5,
                    size: 18,
                  )
                ],
              )
            ],
          ));
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Navigator.pushNamed(context, '/top'),
      //   backgroundColor: const Color.fromARGB(255, 214, 22, 153),
      //   foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      //   child: const Icon(Icons.skip_next),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    }
  }
}
