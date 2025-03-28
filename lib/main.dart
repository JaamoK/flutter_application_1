import 'dart:math';
import 'package:flutter/material.dart';
import 'generated_assets.dart';

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
    final random = Random();

    // Function to get a random image from the generated assets
    String getRandomImage() {
      return GeneratedAssets.images[random.nextInt(GeneratedAssets.images.length)];
    }

    // Determine padding based on screen width
    double horizontalPadding = MediaQuery.of(context).size.width > 1200
        ? 300 // Large PC screens
        : MediaQuery.of(context).size.width > 800
            ? 100 // Tablets and medium PC screens
            : 16; // Phones

    // Determine font scaling based on screen width
    double fontSizeScaling = MediaQuery.of(context).size.width > 800 ? 1.2 : 1.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'EDUKOHUT',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 20 * fontSizeScaling,
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
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Text(
                    'Tilaa Plus',
                    style: TextStyle(fontSize: 14 * fontSizeScaling),
                  ),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          children: [
            // Top Menu
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryButton('Etusivu', fontSizeScaling),
                  _buildCategoryButton('Uutiset', fontSizeScaling),
                  _buildCategoryButton('Urheilu', fontSizeScaling),
                  _buildCategoryButton('Viihde', fontSizeScaling),
                  _buildCategoryButton('Plus', fontSizeScaling),
                  _buildCategoryButton('Sää', fontSizeScaling),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // JUURI NYT Section
            Container(
              color: Colors.yellow,
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'JUURI NYT: ',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 16 * fontSizeScaling,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '"Breaking: Major Storm Expected to Hit the Coast and Cause Severe Damage Across the Region!"',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16 * fontSizeScaling,
                      ),
                      softWrap: true,
                    ),
                  ),
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
                      getRandomImage(),
                      _getFakeNewsTitle(index),
                      fontSizeScaling,
                    );
                  } else if (index % 3 == 1) {
                    // Style 2: Two articles side by side
                    return _buildStyle2Articles(
                      getRandomImage(),
                      getRandomImage(),
                      _getFakeNewsTitle(index),
                      _getFakeNewsTitle(index + 1),
                      fontSizeScaling,
                    );
                  } else {
                    // Style 3: Title only
                    return _buildStyle3Article(
                      _getFakeNewsTitle(index),
                      fontSizeScaling,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      // Bottom Menu
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

  Widget _buildCategoryButton(String title, double fontSizeScaling) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: () {
          print('$title button clicked');
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 14 * fontSizeScaling,
          ),
        ),
      ),
    );
  }

  Widget _buildStyle1Article(String imagePath, String title, double fontSizeScaling) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 4 / 3, // Enforce 4:3 aspect ratio
              child: Image.asset(
                imagePath,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16 * fontSizeScaling,
                ),
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStyle2Articles(
      String imagePath1, String imagePath2, String title1, String title2, double fontSizeScaling) {
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
                  AspectRatio(
                    aspectRatio: 4 / 3, // Enforce 4:3 aspect ratio
                    child: Image.asset(
                      imagePath1,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title1,
                      style: TextStyle(fontSize: 14 * fontSizeScaling),
                      softWrap: true,
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
                  AspectRatio(
                    aspectRatio: 4 / 3, // Enforce 4:3 aspect ratio
                    child: Image.asset(
                      imagePath2,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title2,
                      style: TextStyle(fontSize: 14 * fontSizeScaling),
                      softWrap: true,
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

  Widget _buildStyle3Article(String title, double fontSizeScaling) {
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
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16 * fontSizeScaling,
            ),
            softWrap: true,
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