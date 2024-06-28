import 'package:flutter/material.dart';

class DestinationDetail3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Example content for the third destination detail page
    return Scaffold(
      appBar: AppBar(
        title: Text('Waterfall XYZ Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/waterfall_xyz.jpg'), // Example image
            SizedBox(height: 16),
            Text(
              'Waterfall XYZ, Location ABC',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'A breathtaking waterfall with serene surroundings and vibrant wildlife.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
