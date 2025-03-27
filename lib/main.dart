import 'package:flutter/material.dart';

void main() {
  runApp(const EduKohutApp());
}

class EduKohutApp extends StatelessWidget {
  const EduKohutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduKohut',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'EDUKOHUT',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // Makes the button rectangular
                    ),
                  ),
                  child: const Text('Tilaa Plus'),
                ),
                const SizedBox(width: 15),
                const Icon(
                  Icons.account_circle,
                  color: Colors.grey,
                  size: 30,
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Categories Menu
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Etusivu', style: TextStyle(fontWeight: FontWeight.bold), ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Uutiset', style: TextStyle(fontWeight: FontWeight.bold), ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Urheilu', style: TextStyle(fontWeight: FontWeight.bold), ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Viihde', style: TextStyle(fontWeight: FontWeight.bold), ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Plus', style: TextStyle(fontWeight: FontWeight.bold), ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Sää', style: TextStyle(fontWeight: FontWeight.bold), ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // JUURI NYT Section
          Container(
            color: Colors.yellow,
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'JUURI NYT: ',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Expanded(
                  child: Text(
                    '"Breaking: Major Storm Expected to Hit the Coast!"', // Example title
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis, // Ensures the title doesn't overflow
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // News Highlights Section
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildNewsHighlight('Highlight 1'),
                _buildNewsHighlight('Highlight 2'),
                _buildNewsHighlight('Highlight 3'),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Main News Section
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                if (index % 3 == 0) {
                  // Style 1: Big picture with title
                  return _buildStyle1Article(
                    'assets/news_placeholder.png',
                    _getFakeNewsTitle(index),
                  );
                } else if (index % 3 == 1) {
                  // Style 2: Two articles side by side
                  return _buildStyle2Articles(
                    'assets/news_placeholder1.png',
                    'assets/news_placeholder2.png',
                    _getFakeNewsTitle(index),
                    _getFakeNewsTitle(index + 1),
                  );
                } else {
                  // Style 3: Title only
                  return _buildStyle3Article(_getFakeNewsTitle(index));
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Etusivu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fiber_new),
            label: 'Tuoreimmat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Luetuimmat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'ED-Palat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Valikko',
          ),
        ],
      ),
    );
  }

  // Helper Widget for News Highlights
  Widget _buildNewsHighlight(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(title),
    );
  }

  // Style 1: Big picture with title
  Widget _buildStyle1Article(String imagePath, String title) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Style 2: Two articles side by side
  Widget _buildStyle2Articles(
      String imagePath1, String imagePath2, String title1, String title2) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Image.asset(
                    imagePath1,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title1,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Image.asset(
                    imagePath2,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title2,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Style 3: Title only
  Widget _buildStyle3Article(String title) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  String _getFakeNewsTitle(int index) {
    final titles = [
      "Breaking: Major Storm Expected to Hit the Coast",
      "Local Hero Saves Family from Burning Building",
      "Tech Giants Announce New AI Breakthrough",
      "Sports Update: Championship Finals Tonight",
      "New Study Reveals Surprising Health Benefits of Coffee",
      "Entertainment: Upcoming Movie Breaks Pre-Sale Records",
      "Economy: Stock Market Hits Record Highs",
      "Travel: Top 10 Destinations for 2025 Revealed",
      "Science: NASA Discovers New Exoplanet",
      "Politics: Key Election Debate Scheduled for Tomorrow",
      "Education: Schools to Introduce New Digital Curriculum",
      "Environment: Global Efforts to Combat Climate Change",
      "Fashion: Latest Trends for the Summer Season",
      "Food: Chef Shares Secret Recipe for Perfect Pasta",
      "History: Rare Artifact Unearthed in Ancient Ruins",
      "Health: Experts Warn About Rising Flu Cases",
      "Technology: Smartphone Sales Surge Amid New Releases",
      "World News: Peace Talks Begin in Conflict Zone",
      "Lifestyle: Tips for Achieving Work-Life Balance",
      "Breaking: Local Festival Attracts Thousands of Visitors",
    ];

    return titles[index % titles.length];
  }
}
