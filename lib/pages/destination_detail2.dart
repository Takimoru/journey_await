import 'package:flutter/material.dart';

class DestinationDetail2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Destination Detail'),
      ),
      body: SingleChildScrollView( // Add SingleChildScrollView here
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image with rounded corners
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/kuta.jpg',
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16), // Space under the image

                // Title text
                Text(
                  'Kuta Beach, Bali, Indonesia',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8), // Space under the title

                // Description text
                Text(
                  'Kuta Beach is one of Bali most famous and vibrant beaches, known for its long stretch of golden sand, lively atmosphere, and stunning sunsets. Located in the southern part of Bali, it is a popular destination for surfing, sunbathing, and enjoying beachside activities. The area around Kuta Beach is bustling with restaurants, bars, shops, and nightlife, making it a hotspot for both tourists and locals.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 16), // Space under the description

                // Subtitle for rating with eye icon and star ratings in a rounded container
                Row(
                  children: [
                    Icon(Icons.remove_red_eye, color: Colors.blue),
                    SizedBox(width: 4),
                    Text(
                      'Rating',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8), // Space between text and the rating container
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            color: index < 4 ? Colors.orange : Colors.grey,
                          );
                        }),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16), // Space under the rating row

                // Subtitle for distance in km with map icon in a rounded container
                Row(
                  children: [
                    Icon(Icons.map, color: Colors.green),
                    SizedBox(width: 4),
                    Text(
                      'Distance',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8), // Space between text and the distance container
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.green),
                          SizedBox(width: 4),
                          Text(
                            '150 km',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16), // Space under the distance row

                // Interactive rating button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Action when the button is pressed
                    },
                    child: Text('Rate Now'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
