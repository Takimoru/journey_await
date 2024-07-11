import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
      duration: const Duration(seconds: 15),
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

  void _logout() {
    // Perform logout logic here (e.g., clearing user session data)
    Navigator.pushReplacementNamed(context, '/login'); // Navigate to login screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journey Awaits'),
        backgroundColor: Colors.blue[700],
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
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
                color: Colors.blue[700],
              ),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.blue[700],),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle, color: Colors.blue[700]),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout_rounded, color: Colors.blue[700]),
              title: const Text('Logout'),
              onTap: _logout,
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
              const Text(
                'Hi user,\nYOUR NEXT JOURNEY AWAITS!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
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
                      const Positioned(
                        top: 16,
                        right: 16,
                        child: Text(
                          'Japan Castle',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black,
                                offset: Offset(2.0,2.0),
                              )
                            ],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 36,
                        right: 16,
                        child: Text(
                          'Tokyo, Japan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black,
                                offset: Offset(2.0,2.0),
                              )
                            ],
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
              const SizedBox(height: 16),
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
                    'assets/kuta.jpg',
                    'Kuta Beach, Bali, Indonesia',
                    'A beautiful beach with golden sands and clear waters.',
                    5,
                    '/destinationDetail2',
                  ),
                  _buildDestinationCard(
                    context,
                    'assets/madakaripura.jpg',
                    'Madakaripura Waterfall, Probolinggo Indonesia',
                    'A breathtaking waterfall with serene surroundings.',
                    4,
                    '/destinationDetail3',
                  ),
                ],
              ),
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
              _buildDestinationSection(
                'Beach',
                [
                  _buildDestinationCard(
                    context,
                    'assets/kuta.jpg',
                    'Kuta Beach, Bali, Indonesia',
                    'A beautiful beach with golden sands and clear waters.',
                    5,
                    '/destinationDetail2',
                  ),
                  // Add more Beach destinations here
                ],
              ),
              const SizedBox(height: 16),
              _buildDestinationSection(
                'Waterfall',
                [
                  _buildDestinationCard(
                    context,
                    'assets/madakaripura.jpg',
                    'Madakaripura Waterfall, Probolinggo Indonesia',
                    'A breathtaking waterfall with serene surroundings and vibrant wildlife.',
                    4,
                    '/destinationDetail3',
                  ),
                  // Add more Waterfall destinations here
                ],
              ),
              const SizedBox(height: 100),
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
          backgroundColor: Colors.lightBlueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
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
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),
            ),
          ),
          SizedBox(
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
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
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
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        break;
      case 'Mountain':
        Scrollable.ensureVisible(
          mountainKey.currentContext!,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        break;
      case 'Beach':
        Scrollable.ensureVisible(
          beachKey.currentContext!,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        break;
      case 'Waterfall':
        Scrollable.ensureVisible(
          waterfallKey.currentContext!,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        break;
      default:
        break;
    }
  }

  Widget _buildDestinationCard(
      BuildContext context,
      String imagePath,
      String title,
      String description,
      int rating,
      String route,
      ) {
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
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
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
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
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