import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: 
      //SingleChildScrollView(child:
       Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white,
                    child: Text('UG'),
                  ),
                  SizedBox(width: 8.0,),
                  Column(
                    children: [
                      Text("Daniel_GM", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                      Text("Tezoyuca", style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 69, 68, 68)),),
                    ],
                  ),
                  Spacer(),

                ],
              ),
            ),
            SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(onPressed:()async=>await FirebaseAuth.instance.signOut(), child: const Text('Cerrar sesión')),)
          ],
       // ),
      ),
    );
  }
}