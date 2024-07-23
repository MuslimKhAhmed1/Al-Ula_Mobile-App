import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ObjectPage extends StatelessWidget {
  const ObjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title:const  Text('Exhibits'),
      ),
      body: ListView(
        children: const [
          ExhibitTile(
            image: 'lib/assets/c0.jpg',
            title: '3D object of sculpture',
            description: 'Mr. Ebrahim Baldar the writer',
            additionalInfo: 'Additional information about Exhibit 1...',
            view3DUrl: 'https://framevr.io/ourproject',
          ),
          ExhibitTile(
            image: 'lib/assets/c1.jpg',
            title: '3D object old pot',
            description: 'Description of Exhibit 2',
            additionalInfo: 'a very old pot that used for flowers',
            view3DUrl: 'https://framevr.io/ourproject',
          ),
          ExhibitTile(
            image: 'lib/assets/c1.jpg',
            title: '3D object old pot',
            description: 'Description of Exhibit 2',
            additionalInfo: 'a very old pot that used for flowers',
            view3DUrl: 'https://framevr.io/ourproject',
          ),
          // Add more exhibits as needed
        ],
      ),
    );
  }
}

class ExhibitTile extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final String additionalInfo;
  final String view3DUrl;

  const ExhibitTile({
    required this.image,
    required this.title,
    required this.description,
    required this.additionalInfo,
    required this.view3DUrl,
  });

  @override
  _ExhibitTileState createState() => _ExhibitTileState();
}

class _ExhibitTileState extends State<ExhibitTile> {
  bool _isExpanded = false;
  final Uri _url = Uri.parse('https://framevr.io/ourproject');
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Card(child: Container(height: 200, child: Image.asset(widget.image))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.description),
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.additionalInfo),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Text(_isExpanded ? 'View Less' : 'Learn More'),
              ),
              TextButton(
                onPressed: () async {
                  if (!await launchUrl(_url)) {
                    throw Exception('Could not launch $_url');
                  }
                },
                child: const Text('View in 3D'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
