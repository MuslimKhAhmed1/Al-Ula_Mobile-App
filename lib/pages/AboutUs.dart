import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("About Us"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.share),
              title: Text("Share Application"),
              onTap: (){},
              trailing: Icon(Icons.chevron_right),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.info),
              title: Text("About us"),
              onTap: (){},
              trailing: Icon(Icons.chevron_right),
            ),
          ),
        ],
      ),
    );
  }
}

