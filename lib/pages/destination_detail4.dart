import 'package:flutter/material.dart';

class DestinationDetail4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Example content for the fourth destination detail page
    return Scaffold(
      appBar: AppBar(
        title: Text('Beach ABC Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/beach_abc.jpg'), // Example image
            SizedBox(height: 16),
            Text(
              'Beach ABC, Location XYZ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'An idyllic beach with crystal clear waters and pristine sands.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
