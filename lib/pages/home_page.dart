import 'package:flutter/material.dart';
import 'package:aplikasiwisata/pages/destination_detail.dart'; // Import your destination detail page

class HomePage extends StatelessWidget {
  // Global keys for each category section
  final GlobalKey mountainKey = GlobalKey();
  final GlobalKey beachKey = GlobalKey();
  final GlobalKey waterfallKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Journey Awaits'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage('assets/aduhai.jpg'), // Use your local asset
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting text
              Text(
                'Hi user,\nYOUR NEXT JOURNEY AWAITS!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              // Main Image with corner radius
              Container(
                margin: EdgeInsets.symmetric(vertical: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/jepang.jpg', // Use local asset image
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 16,
                        right: 16,
                        child: Text(
                          'Japan Castle',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        right: 16,
                        child: Text(
                          ' Tokyo, Japan',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Horizontal Scroll Buttons
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryButton('Popular', () {
                      _scrollToCategory('Popular');
                    }),
                    _buildCategoryButton('Beach', () {
                      _scrollToCategory('Beach');
                    }),
                    _buildCategoryButton('Mountain', () {
                      _scrollToCategory('Mountain');
                    }),
                    _buildCategoryButton('Waterfall', () {
                      _scrollToCategory('Waterfall');
                    }),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Horizontal scrolling section for destinations
              _buildDestinationSection(
                'Popular',
                [
                  _buildDestinationCard(
                    context,
                    'assets/semeru.jpg', // Use local asset image
                    'Mount Semeru, Malang, Indonesia',
                    'A magnificent mountain with stunning views and challenging trails.',
                    4, // Star rating out of 5
                  ),
                  _buildDestinationCard(
                    context,
                    'assets/bali_beach.jpg', // Use local asset image
                    'Kuta Beach, Bali, Indonesia',
                    'A beautiful beach with golden sands and clear waters.',
                    5, // Star rating out of 5
                  ),
                ],
              ),
              SizedBox(height: 16),
              _buildDestinationSection(
                'Mountain',
                [
                  _buildDestinationCard(
                    context,
                    'assets/semeru.jpg', // Use local asset image
                    'Mount Semeru, Malang, Indonesia',
                    'A magnificent mountain with stunning views and challenging trails.',
                    4, // Star rating out of 5
                  ),
                  // Add more Mountain destinations here
                ],
              ),
              SizedBox(height: 16),
              _buildDestinationSection(
                'Beach',
                [
                  _buildDestinationCard(
                    context,
                    'assets/bali_beach.jpg', // Use local asset image
                    'Kuta Beach, Bali, Indonesia',
                    'A beautiful beach with golden sands and clear waters.',
                    5, // Star rating out of 5
                  ),
                  // Add more Beach destinations here
                ],
              ),
              SizedBox(height: 16),
              _buildDestinationSection(
                'Waterfall',
                [
                  // Add Waterfall destinations here
                ],
              ),
              SizedBox(height: 100), // Additional space at the bottom for demonstration
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build category buttons with corner radius
  Widget _buildCategoryButton(String label, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onTap,
        child: Text(label),
      ),
    );
  }

  // Helper method to build destination sections
  Widget _buildDestinationSection(String category, List<Widget> destinations) {
    return Column(
      key: category == 'Popular'
          ? GlobalKey()
          : category == 'Mountain'
          ? mountainKey
          : category == 'Beach'
          ? beachKey
          : category == 'Waterfall'
          ? waterfallKey
          : null,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            category,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: destinations,
          ),
        ),
      ],
    );
  }

  // Method to scroll to a specific category
  void _scrollToCategory(String category) {
    switch (category) {
      case 'Popular':
        Scrollable.ensureVisible(
          GlobalKey() as BuildContext,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        break;
      case 'Mountain':
        Scrollable.ensureVisible(
          mountainKey.currentContext!,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        break;
      case 'Beach':
        Scrollable.ensureVisible(
          beachKey.currentContext!,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        break;
      case 'Waterfall':
        Scrollable.ensureVisible(
          waterfallKey.currentContext!,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        break;
      default:
        break;
    }
  }

  // Helper method to build destination cards with corner radius and shadow
  Widget _buildDestinationCard(BuildContext context, String imagePath, String title, String description, int rating) {
    return GestureDetector(
      onTap: () {
        // Navigate to the destination detail page
        Navigator.pushNamed(
          context,
          '/destinationDetail',
          arguments: {
            'imagePath': imagePath,
            'title': title,
            'description': description,
          },
        );
      },
      child: Container(
        width: 250,
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset(
                imagePath,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        Icons.star,
                        color: index < rating ? Colors.orange : Colors.grey,
                        size: 16,
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
