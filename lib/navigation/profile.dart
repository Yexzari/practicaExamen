import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.brown.shade800,
                    foregroundColor: Colors.white,
                    child: const Text('OV'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Omar_Verdayes",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                      Text("Hace 10 dias" , style: TextStyle(fontSize: 11, color: Colors.black54),),
                    ],
                  ),
                  const Spacer(), //Expanded(child: Align(child: Icon(Icons.more_vert), alignment: Alignment.centerRight,)),//tambien funciona para alinear

                  const Icon(Icons.more_vert)
                ],
              ),
            ),
            Image.asset(
              "assets/logo.png",
              width: double.infinity,
              height: 350,
            ),
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.favorite),
                  Icon(Icons.message),
                  Icon(Icons.ios_share_outlined),
                  Spacer(),
                  Icon(Icons.save)
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("Texto1"),
                  Text("Texto2"),
                  Text("Texto3"),
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Text("hola")),
                Expanded(child: Text("holdasdasdasdasdasdsddsfdsfsdds fsdf sdf sdf sdkf sd kfsdkf ñff a")),
                Expanded(child: Text("hola")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
