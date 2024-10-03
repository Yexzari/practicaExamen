import 'package:flutter/material.dart';

class top extends StatelessWidget {
  const top({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top 5'),
      ),
      body: const Center(
        child: Text('top 5'),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Navigator.pushNamed(context,'/reservations') ,
      //   backgroundColor: const Color.fromARGB(255, 214, 22, 153),
      //   foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      //   child: const Icon(Icons.skip_next_outlined),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}