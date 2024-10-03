// import 'package:flutter/material.dart';
// import 'package:learning_b/widgets/ContentColumn.dart';

// class home extends StatelessWidget {
//   const home({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Inicio'),
//       ),
//       body: const Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Row(
//           children: [
//             ContentColumn(
//               title: 'primer columna',
//               description: 'primer parrafo',
//             ),
//             ContentColumn(
//                 description: 'segundo parrafo', title: 'segunda columna'),
//             ContentColumn(
//                 description: 'tercer parrafo', title: 'tercera columna')
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => print('Hola'),
//         backgroundColor: const Color.fromARGB(255, 214, 22, 153),
//         foregroundColor: const Color.fromARGB(255, 255, 255, 255),
//         child: const Icon(Icons.plus_one),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//     );
//   }
// }
