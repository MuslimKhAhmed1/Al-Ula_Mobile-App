import 'package:al_ula2/pages/AboutUs.dart';
import 'package:al_ula2/pages/HomePage.dart';
import 'package:al_ula2/pages/ObjectPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme:const AppBarTheme(
          elevation: 5,
          centerTitle: true,
          foregroundColor: Colors.white,
          toolbarHeight: 70,
            backgroundColor:Colors.purple,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),


        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/30.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Dark overlay
          Container(
            color: Colors.black54,
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Icon(Icons.museum_outlined,size: 100,color: Colors.white,),

                const Padding(
                  padding:  EdgeInsets.all(10.0),
                  child:  Text(
                    'Welcome to Al-Ula Educational Museum',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.purple,
                  endIndent: 50,
                  indent: 50,
                  thickness: 5,
                  height: 20,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: Buttonstyle(),
                  onPressed: () {
                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) =>const HomePage()));
                  },
                  child: const Text(' Home ',style: TextStyle(fontSize: 20),),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: Buttonstyle(),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ObjectPage()));
                  },
                  child: const Text(' 3D Objects ',style: TextStyle(fontSize: 20),),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: Buttonstyle(),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) =>const AboutUs()));
                  },
                  child: const Text('About Us',style: TextStyle(fontSize: 20),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ButtonStyle Buttonstyle() {
    return const ButtonStyle(

      side: WidgetStatePropertyAll(BorderSide(color: Colors.purple, width: 2)),
      overlayColor: WidgetStatePropertyAll(Color.fromARGB(255, 146, 146, 146)),
      elevation: WidgetStatePropertyAll(10),
      animationDuration: Duration(seconds: 2),
      enableFeedback: true,
      fixedSize: WidgetStatePropertyAll(Size(280, 60)),
    );
  }
}
