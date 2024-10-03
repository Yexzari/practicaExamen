import 'package:flutter/material.dart';

class reservations extends StatelessWidget {
  const reservations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservaciones'),
      ),
      body: const Center(
        child: Text('reservaciones'),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Navigator.pushNamed(context,'/profile') ,
      //   backgroundColor: const Color.fromARGB(255, 214, 22, 153),
      //   foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      //   child: const Icon(Icons.skip_next_sharp),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}