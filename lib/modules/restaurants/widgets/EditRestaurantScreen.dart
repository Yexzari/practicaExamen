/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learning_b/modules/restaurants/entity/restaurant.dart';

class EditRestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;

  EditRestaurantScreen({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController(text: restaurant.name);
    final TextEditingController descriptionController = TextEditingController(text: restaurant.description);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Restaurante'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nombre del Restaurante'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Dirección'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _updateRestaurant(restaurant.id, nameController.text, descriptionController.text);
                Navigator.pop(context);
              },
              child: const Text('Guardar Cambios'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _updateRestaurant(String restaurantId, String newName, String newAddress) async {
    final restaurantRef = FirebaseFirestore.instance.collection('restaurants').doc(restaurantId);

    try {
      await restaurantRef.update({
        'name': newName,
        'address': newAddress,
      });
      print('Restaurante actualizado');
    } catch (e) {
      print('Error al actualizar el restaurante: $e');
    }
  }
}
*/