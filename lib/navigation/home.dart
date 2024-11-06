import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learning_b/modules/restaurants/entity/restaurant.dart';
import 'package:learning_b/modules/restaurants/widgets/custom_lits_restaurants.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

final db = FirebaseFirestore.instance;

class _homeState extends State<home> {
  bool _isLoading = true;
  List<Restaurant> restaurants = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      db.collection("restaurants").snapshots().listen(
        (event) {
          List<Restaurant> fetchedRestaurants = [];
          
          for (var doc in event.docs) {
            final data = doc.data() as Map<String, dynamic>;

            final images = List<String>.from(data["image"] ?? []);
            
            final Restaurant restaurant = Restaurant.fromMap(data, doc.id);
            fetchedRestaurants.add(restaurant);
          }

          if (mounted) {
            setState(() {
              restaurants = fetchedRestaurants;
              _isLoading = false;
            });
          }
        },
        onError: (error) {
          print("Error al obtener datos: $error");
        },
      );
    } catch (e) {
      print("Error al obtener datos: $e");
    }
  }

Future<void> addRestaurant(Restaurant restaurant) async {
  try {
    final docRef = await db.collection("restaurants").add(restaurant.toMap());

    Restaurant newRestaurant = Restaurant(
      restaurant.name,
      restaurant.description,
      restaurant.images,
      restaurant.rating,
      restaurant.count,
    )..id = docRef.id;

    setState(() {
      restaurants.add(newRestaurant); 
    });
  } catch (e) {
    print("Error al agregar restaurante: $e");
  }
}


  Future<void> updateRestaurant(String restaurantId, Restaurant restaurant) async {
    try {
      await db.collection("restaurants").doc(restaurantId).update(restaurant.toMap());
    } catch (e) {
      print("Error al actualizar restaurante: $e");
    }
  }

  Future<void> deleteRestaurant(String restaurantId) async {
    try {
      await db.collection("restaurants").doc(restaurantId).delete();
    } catch (e) {
      print("Error al eliminar restaurante: $e");
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
          title: const Text('Restaurantes'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => _buildAddRestaurantDialog(),
                );
              },
            ),
          ],
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
                child: Column(
                  children: [
                    CuscomListRestaurants(restaurant: restaurant),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            // Lógica para editar el restaurante
                            // Por ejemplo, puedes mostrar un formulario de edición
                            showDialog(
                              context: context,
                              builder: (context) => _buildEditRestaurantDialog(restaurant),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            deleteRestaurant(restaurant.id); // Eliminar restaurante
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }

  // Dialogo para agregar un restaurante
  Widget _buildAddRestaurantDialog() {
    TextEditingController nameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController countController = TextEditingController();
    List<String> images = [];

    return AlertDialog(
      title: const Text('Agregar Restaurante'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Nombre'),
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(labelText: 'Descripción'),
          ),
          TextField(
            controller: countController,
            decoration: const InputDecoration(labelText: 'Count'),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Restaurant newRestaurant = Restaurant(
              nameController.text,
              descriptionController.text,
              images,
              0.0,
              int.tryParse(countController.text) ?? 0,
            );
            addRestaurant(newRestaurant);
            Navigator.of(context).pop();
          },
          child: const Text('Agregar'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
      ],
    );
  }

  // Dialogo para editar un restaurante
  Widget _buildEditRestaurantDialog(Restaurant restaurant) {
    TextEditingController nameController = TextEditingController(text: restaurant.name);
    TextEditingController descriptionController = TextEditingController(text: restaurant.description);
    TextEditingController countController = TextEditingController(text: restaurant.count.toString());
    List<String> images = restaurant.images;

    return AlertDialog(
      title: const Text('Editar Restaurante'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Nombre'),
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(labelText: 'Descripción'),
          ),
          TextField(
            controller: countController,
            decoration: const InputDecoration(labelText: 'Count'),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Restaurant updatedRestaurant = Restaurant(
              nameController.text,
              descriptionController.text,
              images,
              0.0,
              int.tryParse(countController.text) ?? 0,
            );
            updateRestaurant(restaurant.id, updatedRestaurant);
            Navigator.of(context).pop();
          },
          child: const Text('Actualizar'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
      ],
    );
  }
}
