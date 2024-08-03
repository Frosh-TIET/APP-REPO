import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  List<String> imageUrls = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  Future<void> loadImages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cachedUrls = prefs.getStringList('scheduleImageUrls');

    if (cachedUrls != null && cachedUrls.isNotEmpty) {
      setState(() {
        imageUrls = cachedUrls;
        isLoading = false;
      });
    } else {
      try {
        final storage = FirebaseStorage.instance;
        List<String> urls = [];

        for (int i = 1; i <= 5; i++) {
          String imagePath = 'images/schedule/b$i.webp';
          String downloadURL = await storage.ref(imagePath).getDownloadURL();
          urls.add(downloadURL);
        }

        await prefs.setStringList('scheduleImageUrls', urls);

        setState(() {
          imageUrls = urls;
          isLoading = false;
        });
      } catch (e) {
        print('Error loading images: $e');
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bgr.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.white.withOpacity(0.23),
            ),
          ),
          isLoading
              ? Center(child: CircularProgressIndicator(color: Colors.transparent,))
              : ListView.builder(
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              bool isEven = index % 2 == 1;
              return Align(
                alignment:
                isEven ? Alignment.centerLeft : Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.05,
                    right: screenWidth * 0.05,
                    top: screenHeight * 0.015,
                    bottom: screenHeight * 0.015,
                  ),
                  child: Container(
                    width: screenWidth * 0.42,
                    height: screenHeight * 0.19,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      color: Colors.black.withOpacity(0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: CachedNetworkImage(
                        imageUrl: imageUrls[index],
                        fit: BoxFit.fill,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(color: Colors.transparent,),
                        errorWidget: (context, url, error) =>
                            Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}