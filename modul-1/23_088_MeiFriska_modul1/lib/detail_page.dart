import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map<String, String> place;

  const DetailPage({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place['title'] ?? 'Detail'),
        centerTitle: true, // ini yang bikin judul di tengah
        backgroundColor: const Color.fromARGB(255, 232, 236, 240),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            place['image'] ?? '',
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  place['title'] ?? '',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                if (place.containsKey('location')) ...[
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.redAccent),
                      SizedBox(width: 4),
                      Text(place['location'] ?? '', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
                if (place.containsKey('desc')) ...[
                  SizedBox(height: 16),
                  Text(
                    place['desc'] ?? '',
                    style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 8, 8, 8)),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
