import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: const Center(
        child: Text('inicio'),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Navigator.pushNamed(context,'/top') ,
      //   backgroundColor: const Color.fromARGB(255, 214, 22, 153),
      //   foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      //   child: const Icon(Icons.skip_next),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}