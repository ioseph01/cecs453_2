import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: SlideCyclerApp()));

// Data model
class ArtEntry {
  final String title;
  final String artist;
  final String date;
  final String asset_path;

  const ArtEntry({
    required this.title,
    required this.artist,
    required this.date,
    required this.asset_path,
  });
}

class SlideData {
  final String title;
  final String assetPath;

  const SlideData({required this.title, required this.assetPath});
}

class SlideCyclerApp extends StatefulWidget {
  const SlideCyclerApp({super.key});

  @override
  State<SlideCyclerApp> createState() => _SlideCyclerAppState();
}

class _SlideCyclerAppState extends State<SlideCyclerApp> {
  int idx = 0;

  // Data list
  final List<ArtEntry> artworks = const [
    ArtEntry(title: "Still life with Flowers and Fruits", artist: "Jan Van Huysum", date: "1715", asset_path: "assets/images/1.jpg"),
    ArtEntry(title: "Still Life with a Goblet of Wine, Fruit and Oysters", artist: "Abraham Mignon", date: "1670", asset_path: "assets/images/2.jpeg"),
    ArtEntry(title: "Mountain Summit", artist: "Bob Ross", date: "1982", asset_path: "assets/images/3.png"),
    ArtEntry(title: "Bridge over a Pond of Water Lilies", artist: "Claude Monet", date: "1899", asset_path: "assets/images/4.jpg"),
    ArtEntry(title: "The Exotic Landscape", artist: "Henri Rosseau", date: "1910", asset_path: "assets/images/5.jpg"),
    ArtEntry(title: "The Lake at Hakone (No. 11)", artist: "Utagawa Hiroshige", date: "1833", asset_path: "assets/images/6.png"),
  ];

  @override
  Widget build(BuildContext context) {
    final currentSlide = artworks[idx];

    return Scaffold(
      appBar: AppBar(title: const Text('Art Gallery')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 250,
                width: double.infinity,
                child:
                  Center(
                      child: Image.asset(
                        currentSlide.asset_path,
                        fit: BoxFit.contain,
                        width: double.infinity,
                        height:250
                      ),
                    )
              ),
              const SizedBox(height: 32),
              Column(
                children: [
                  Text(
                    currentSlide.title,
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentSlide.artist,
                        style: const TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        ' (${currentSlide.date})',
                        style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center,
                      )
                    ],
                  )
                ]
              ),
              SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        setState(() {
                          idx = (idx - 1) % artworks.length;
                        });
                      },
                      child: Text("Previous")
                  ),
                  OutlinedButton(
                      onPressed: () {
                        setState(() {
                          idx = (idx + 1) % artworks.length;
                        });
                      },
                      child: Text("Next")
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
