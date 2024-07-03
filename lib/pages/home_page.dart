import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final GlobalKey mountainKey = GlobalKey();
  final GlobalKey beachKey = GlobalKey();
  final GlobalKey waterfallKey = GlobalKey();
  final PageController _pageController = PageController();
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 15),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        _pageController.jumpTo(
          _animation.value * _pageController.position.maxScrollExtent,
        );
      });

    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

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
              backgroundImage: AssetImage('assets/aduhai.jpg'),
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
              leading: Icon(Icons.logout_rounded),
              title: Text('Logout'),
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
              Text(
                'Hi user,\nYOUR NEXT JOURNEY AWAITS!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
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
                        'assets/jepang.jpg',
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
                          'Tokyo, Japan',
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
              _buildDestinationSection(
                'Popular',
                [
                  _buildDestinationCard(
                    context,
                    'assets/semeru.jpg',
                    'Mount Semeru, Malang, Indonesia',
                    'A magnificent mountain with stunning views and challenging trails.',
                    4,
                    '/destinationDetail',
                  ),
                  _buildDestinationCard(
                    context,
                    'assets/bali_beach.jpg',
                    'Kuta Beach, Bali, Indonesia',
                    'A beautiful beach with golden sands and clear waters.',
                    5,
                    '/destinationDetail2',
                  ),
                  _buildDestinationCard(
                    context,
                    'assets/waterfall_xyz.jpg',
                    'Waterfall XYZ, Location ABC',
                    'A breathtaking waterfall with serene surroundings and vibrant wildlife.',
                    4,
                    '/destinationDetail3',
                  ),
                  _buildDestinationCard(
                    context,
                    'assets/beach_abc.jpg',
                    'Beach ABC, Location XYZ',
                    'An idyllic beach with crystal clear waters and pristine sands.',
                    5,
                    '/destinationDetail4',
                  ),
                ],
              ),
              SizedBox(height: 16),
              _buildDestinationSection(
                'Mountain',
                [
                  _buildDestinationCard(
                    context,
                    'assets/semeru.jpg',
                    'Mount Semeru, Malang, Indonesia',
                    'A magnificent mountain with stunning views and challenging trails.',
                    4,
                    '/destinationDetail',
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
                    'assets/bali_beach.jpg',
                    'Kuta Beach, Bali, Indonesia',
                    'A beautiful beach with golden sands and clear waters.',
                    5,
                    '/destinationDetail2',
                  ),
                  // Add more Beach destinations here
                ],
              ),
              SizedBox(height: 16),
              _buildDestinationSection(
                'Waterfall',
                [
                  _buildDestinationCard(
                    context,
                    'assets/waterfall_xyz.jpg',
                    'Waterfall XYZ, Location ABC',
                    'A breathtaking waterfall with serene surroundings and vibrant wildlife.',
                    4,
                    '/destinationDetail3',
                  ),
                  // Add more Waterfall destinations here
                ],
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

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

  Widget _buildDestinationSection(String category, List<Widget> destinations) {
    if (category == 'Popular') {
      return Column(
        key: GlobalKey(),
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
          Container(
            height: 250,
            child: PageView.builder(
              controller: _pageController,
              itemBuilder: (context, index) {
                final destination = destinations[index % destinations.length];
                return destination;
              },
              itemCount: destinations.length,
            ),
          ),
        ],
      );
    } else {
      return Column(
        key: category == 'Mountain'
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
  }

  void _scrollToCategory(String category) {
    switch (category) {
      case 'Popular':
        Scrollable.ensureVisible(
          GlobalKey().currentContext!,
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

  Widget _buildDestinationCard(BuildContext context, String imagePath, String title, String description, int rating, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          route,
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
              offset: Offset(0, 3),
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
