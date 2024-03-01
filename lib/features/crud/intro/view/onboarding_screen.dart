import 'package:flutter/material.dart';
import 'package:mobile_user_app/configs/theme/app_themes.dart';
import 'package:mobile_user_app/features/crud/get_user/view/list_page.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            currentPage = value;
          });
        },
        children: [
          buildPageView('assets/images/image1.jpg', 'Judul 1', 'Ini adalah Deskripsi 1'),
          buildPageView('assets/images/image2.jpg', 'Judul 2', 'Ini adalah Deskripsi 2'),
          buildPageView('assets/images/image3.jpg', 'Judul 3', 'Ini adalah Deskripsi 3'),
          buildPageView('assets/images/image1.jpg', 'Judul 4', 'Ini adalah Deskripsi 4'),
        ],
      ),
      bottomSheet: currentPage != 3
          ? Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  _pageController.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryColor,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50, vertical: 20),
                ),
                child: Text('PREV', style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () {
                  _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryColor,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50, vertical: 20),
                ),
                child: Text('NEXT', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      )
          : InkWell(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => UserListPage()),
          );
        },
        child: Container(
          height: 60,
          color: secondaryColor,
          alignment: Alignment.center,
          child: Text(
            'GET STARTED',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }

  Column buildPageView(String imagePath, String title, String description) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
            child: Image.asset(imagePath, width: 200,), ),
        SizedBox(height: 20),
        Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text(description, textAlign: TextAlign.center),
        SizedBox(height: 20)
      ],
    );
  }
}