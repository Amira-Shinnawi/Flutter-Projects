import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Business_Card());
}

// ignore: camel_case_types
class Business_Card extends StatelessWidget {
  const Business_Card({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF2B475E),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 112,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 110,
                  backgroundImage: AssetImage(
                      'assets/images/buisness_Card.png'),
                ),
              ),
              Text(
                'Amira Shinnawi',
                style: GoogleFonts.pacifico(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              const Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  color: Color(0xFF6C8090),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(
                color: Color(0xFF6C8090),
                thickness: 1,
                endIndent: 30,
                indent: 30,
                height: 10,
              ),
               Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child:const ListTile(
                  leading: Icon(
                    Icons.phone,
                    size: 32,
                    color: Color(0xFF2B475E),
                  ),
                  title: Text(
                    '(+20) 1025167595',
                    style: TextStyle(fontSize: 24, color: Color(0xFF2B475E)),
                  ),
                ),
              ),
              const Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: Icon(
                    Icons.mail,
                    size: 32,
                    color: Color(0xFF2B475E),
                  ),
                  title: Text(
                    'amirashenawy@gmail.com',
                    style: TextStyle(fontSize: 24, color: Color(0xFF2B475E)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
