import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  String emailAddress = "", password = "";
  bool st = false;
  bool showprogress = false;
    final authInstance = FirebaseAuth.instance;
  final databaseinstance = FirebaseFirestore.instance;
  String _message = '';
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          fit: StackFit.expand, 
          children: <Widget>[
            Image.asset(
              'images/second.jpg',
              fit: BoxFit.cover, 
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                 const  SizedBox(
                    height: 150,
                  ),
                  const Text("₊˚⊹ Welcome back! ₊˚✦", style: TextStyle(color: Color.fromARGB(255, 255, 141, 164), fontSize: 25, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                 const SizedBox(
                    height: 50,
                  ),
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: TextField(
                    cursorColor: Color.fromARGB(255, 254, 128, 147),
                    onChanged: (val) {
                      emailAddress = val;
                    },
                    keyboardType: TextInputType.emailAddress,
                               decoration: const InputDecoration(
                  hintText: "input email here",
                  focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 254, 128, 147), width: 2.0),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 1.0),
              ),
                               ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: TextField(
                    cursorColor: Color.fromARGB(255, 254, 128, 147),
                    obscureText: st,
                    onChanged: (val) {
                      password = val;
                    },
                    keyboardType: TextInputType.emailAddress,
                    
                               decoration: InputDecoration(
                  hintText: "input password here",
                  suffixIcon: GestureDetector(
                  onTap: (){
                    setState(() {
                      st = !st;
                    });
                  },
                  child: st
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
                ),
                focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 254, 128, 147), width: 2.0),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 1.0),
              ),
                    ),
                  ),
                ),
                showprogress?
            LoadingAnimationWidget.prograssiveDots(color: Color.fromARGB(255, 254, 128, 147), size: 50):SizedBox(),
            SizedBox(height: 20,),
                RawMaterialButton(
                  fillColor: Color.fromARGB(255, 253, 221, 127),
                  onPressed: () async {
               setState(() {
                      showprogress = true;
                   });
                   try{ 
              await authInstance.signInWithEmailAndPassword(
                email: emailAddress, password: password);
                Navigator.pushNamed(context, '/homescreen');
               setState(() {_message = "log in successful";}
               
               );} on FirebaseAuthException catch (e){
                 setState(() {_message = "Error: ${e.message}";}
                 );
                } catch (e) {
              setState(() {_message = "Error: $e";}
              );
            }
                  },
                  child: Text("log in"),
                )
                ],
              ),
            )
          ]
      )
    );
  }
}