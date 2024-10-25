import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:learning_b/modules/restaurants/entity/restaurant.dart';
import 'package:learning_b/modules/restaurants/widgets/custom_lits_restaurants.dart';

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
    // Escuchar los cambios en la colección
    db.collection("restaurants").snapshots().listen(
      (event) {
        restaurants.clear();

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
          restaurants.add(restaurant);
        }

        if (mounted) {
          setState(() {
            _isLoading = false; 
          });
        }
      },
      onError: (error) {
        print("Listen failed: $error");
      },
    );
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
        body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: restaurants.length,
          itemBuilder: (context, index) {
            final restaurant = restaurants[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.blue[200],
                child: CuscomListRestaurants(restaurant: restaurant),
              ),
            );
          },
        ),
      );
    }
  }
}
