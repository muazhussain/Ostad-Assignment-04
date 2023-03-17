import 'package:flutter/material.dart';
import 'items.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 152, 203, 228),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 152, 203, 228),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.menu),
            SizedBox(
              height: 30,
              width: 30,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network('https://img.icons8.com/external-victoruler-linear-colour-victoruler/344/external-doctor-medical-staff-characters-victoruler-linear-colour-victoruler-5.png'),
              ),
            ),
          ],
        ),
      ),
      body: const toDoitems(),
    );
  }
}