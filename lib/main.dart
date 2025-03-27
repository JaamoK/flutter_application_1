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
                      borderRadius: BorderRadius.zero,
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
              children: [
                _buildCategoryButton('Etusivu'),
                _buildCategoryButton('Uutiset'),
                _buildCategoryButton('Urheilu'),
                _buildCategoryButton('Viihde'),
                _buildCategoryButton('Plus'),
                _buildCategoryButton('Sää'),
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
                    '"Breaking: Major Storm Expected to Hit the Coast and Cause Severe Damage Across the Region!"',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
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
                  );
                } else if (index % 3 == 1) {
                  // Style 2: Two articles side by side
                  return _buildStyle2Articles(
                    getRandomImage(),
                    getRandomImage(),
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
    );
  }

  Widget _buildCategoryButton(String title) {
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
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
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
                softWrap: true,
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
            softWrap: true,
          ),
        ),
      ),
    );
  }

  // Fake news titles
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