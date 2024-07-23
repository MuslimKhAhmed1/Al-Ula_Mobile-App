import 'package:al_ula2/pages/panoramas.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeSection(),
    PanoramaSection(),
    MapSection(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Al-ula Museum'),
          actions: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.panorama), label: 'Panorama'),
            BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.purple,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        CarouselSlider(
          options: CarouselOptions(height: 200.0, autoPlay: true),
          items: [
            'lib/assets/2.jpg',
            'lib/assets/31.jpg',
            'lib/assets/25.jpg',
            'lib/assets/7.jpg',
            'lib/assets/14.jpg',
            'lib/assets/15.jpg',
            'lib/assets/27.jpg',
            'lib/assets/28.png',
            'lib/assets/29.jpg'
          ].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(i),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Welcome to Al-Ula Museum',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            'Erbil’s Oldest Kurdish School Serves as Education Museum',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          "About The place",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16),
            "Erbil, with its ancient roots and vibrant cultural tapestry, stands as a testament to the enduring spirit of humanity's quest for knowledge and understanding. At the heart of this city lies a symbol of educational enlightenment: Erbil Ula, the first Kurdish school established in 1920. Over the decades, this institution has evolved into more than just a center of learning; it has become a custodian of Erbil's rich educational heritage. Today, transformed into the Erbil Educational Museum, it serves as a beacon of cultural preservation and celebration, inviting visitors to embark on a journey through time and immerse themselves in the stories of generations past.",
          ),
        ),
        // Add more sections as needed
      ],
    );
  }
}

class PanoramaSection extends StatelessWidget {
  const PanoramaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Pan1(),
              )),
          child: Stack(alignment: Alignment.center, children: [
            Card(
              elevation: 12,
              child: Container(
                height: 200,
                width: double.infinity,
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  "lib/assets/29.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text(
              "  Outside  ",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                  backgroundColor: Color.fromRGBO(255, 255, 255, 0.7),
                  color: Colors.purple),
            ),
          ]),
        ),
        GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Pan2(),
              )),
          child: Stack(alignment: Alignment.center, children: [
            Card(
              elevation: 12,
              child: Container(
                margin: const EdgeInsets.all(5),
                height: 200,
                width: double.infinity,
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  "lib/assets/14.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text(
              "  Room 1 (360)  ",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  backgroundColor: Color.fromRGBO(255, 255, 255, 0.7),
                  color: Colors.purple),
            ),
          ]),
        ),
        GestureDetector(
          // onTap: () => Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const Model2(),
          //     )),
          child: Stack(alignment: Alignment.center, children: [
            Card(
              elevation: 12,
              child: Container(
                margin: const EdgeInsets.all(5),
                height: 200,
                width: double.infinity,
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  "lib/assets/31.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text(
              "  Room 2 (360)  ",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  backgroundColor: Color.fromRGBO(255, 255, 255, 0.7),
                  color: Colors.purple),
            ),
          ]),
        ),
      ],
    ));
  }
}

class MapSection extends StatelessWidget {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  MapSection({super.key});

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width, // or a specific height
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}


// class MapSection extends StatelessWidget {
//
//   late GoogleMapController mapController;
//
//   final LatLng _center = const LatLng(45.521563, -122.677433);
//
//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child:
//         GoogleMap(
//         onMapCreated: _onMapCreated,
//         initialCameraPosition: CameraPosition(
//           target: _center,
//           zoom: 11.0,
//         ),
//     )
//     );
//   }
// }
