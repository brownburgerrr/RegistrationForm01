import 'package:flutter/material.dart';

class firstscreen extends StatefulWidget {
  const firstscreen({super.key});

  @override
  State<firstscreen> createState() => _firstscreenState();
}

class _firstscreenState extends State<firstscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          fit: StackFit.expand, 
          children: <Widget>[
            Image.asset(
              'images/first.jpg',
              fit: BoxFit.cover, 
            ),
             SingleChildScrollView(
               child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const Text("⋅˚₊‧ ୨୧ ‧₊˚ ⋅", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 30, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  const Text("a minimal", style: TextStyle(color: Color.fromARGB(255, 255, 126, 158), fontSize: 30, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  const Text("registration", style: TextStyle(color: Color.fromARGB(255, 255, 126, 158), fontSize: 30, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  const Text("application.", style: TextStyle(color: Color.fromARGB(255, 255, 126, 158), fontSize: 30, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  const SizedBox(
                    height: 300,
                  ),
                  Opacity(
                    opacity: 0.4,
                    child: RawMaterialButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/loginscreen');
                    } ,
                     fillColor: const Color.fromARGB(255, 32, 0, 6),
                           child: const Padding(
                padding: EdgeInsets.only(left: 100, right: 100),
                child: Text(
                  'log in',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), 
                  ),
                    ),
                           ),
                           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(5),
                           ),
                  )
                  ),
                  Opacity(
                    opacity: 0.4,
                    child: RawMaterialButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/signupscreen');
                    } ,
                     fillColor: Color.fromARGB(255, 32, 0, 6),
                           child: const Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: Text(
                  'create an account',
                  style: TextStyle(
                    color: Color.fromARGB(255, 252, 81, 101), 
                  ),
                    ),
                           ),
                           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(5),
                           ),
                  )
                  ),
                ],
                           ),
             )
          ],
        ),
           
    );
  }
}