import 'package:flutter/material.dart';

class DestinationDetail2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Example content for DestinationDetail2 page
    return Scaffold(
      appBar: AppBar(
        title: Text('Kuta Beach Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/bali_beach.jpg'),
            SizedBox(height: 16),
            Text(
              'Kuta Beach, Bali, Indonesia',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'A beautiful beach with golden sands and clear waters.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
