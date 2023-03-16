import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class GlamSpotHomeScreen extends StatefulWidget {
  const GlamSpotHomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<GlamSpotHomeScreen> {
  // List of featured artisans
  List<Artisan> featuredArtisans = [
    Artisan(
        name: "John Doe",
        specialty: "Woodworking",
        profilePicture: "assets/profile1.jpg"),
    Artisan(
        name: "Jane Smith",
        specialty: "Pottery",
        profilePicture: "assets/profile2.jpg"),
    Artisan(
        name: "Bob Johnson",
        specialty: "Jewelry",
        profilePicture: "assets/profile3.jpg"),
  ];

  // List of recently viewed artisans
  List<Artisan> recentlyViewedArtisans = [
    Artisan(
        name: "John Doe",
        specialty: "Woodworking",
        profilePicture: "assets/profile1.jpg"),
    Artisan(
        name: "Jane Smith",
        specialty: "Pottery",
        profilePicture: "assets/profile2.jpg"),
    Artisan(
        name: "Bob Johnson",
        specialty: "Jewelry",
        profilePicture: "assets/profile3.jpg"),
  ];

  // List of short videos of artisan work
  List<Video> artisanWorkVideos = [
    Video(videoUrl: "assets/video1.mp4"),
    Video(videoUrl: "assets/video2.mp4"),
    Video(videoUrl: "assets/video3.mp4"),
  ];

  // List of special offers
  List<SpecialOffer> specialOffers = [
    SpecialOffer(
        title: "50% off pottery classes with Jane Smith",
        description: "Limited time offer! Book now."),
    SpecialOffer(
        title: "Free shipping on all jewelry orders",
        description: "Use code FREESHIP at checkout."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // Navigation bar
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Featured Artisans
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Featured Artisans",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: featuredArtisans.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                              featuredArtisans[index].profilePicture),
                        ),
                        SizedBox(height: 8),
                        Text(featuredArtisans[index].name),
                        Text(featuredArtisans[index].specialty),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Short Videos of Artisan Work
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Short Videos of Artisan Work",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ), 
           
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: artisanWorkVideos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: VideoPlayerWidget(
                            videoUrl: artisanWorkVideos[index].videoUrl,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Special Offers
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Special Offers",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: specialOffers.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.blue,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              specialOffers[index].title,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              specialOffers[index].description,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Recently Viewed
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Recently Viewed",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: recentlyViewedArtisans.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                              recentlyViewedArtisans[index].profilePicture),
                        ),
                        SizedBox(height: 8),
                        Text(recentlyViewedArtisans[index].name),
                        Text(recentlyViewedArtisans[index].specialty),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Artisan {
  final String name;
  final String specialty;
  final String profilePicture;

  Artisan(
      {required this.name,
      required this.specialty,
      required this.profilePicture});
}

class Video {
  final String videoUrl;

  Video({required this.videoUrl});
}

class SpecialOffer {
  final String title;
  final String description;

  SpecialOffer({required this.title, required this.description});
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({super.key, required this.videoUrl});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GestureDetector(
            onTap: () {
              setState(() {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  _controller.play();
                }
              });
            },
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
