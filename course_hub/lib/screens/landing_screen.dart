import 'package:course_hub/auth/login_or_register.dart';
import 'package:course_hub/data/features_data.dart';
import 'package:course_hub/screens/feature_screen.dart';
import 'package:course_hub/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LandingScreen extends StatefulWidget {
  static const String id = 'landing';

  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final PageController _controller = PageController();
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  String? token;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  Future<void> _checkToken() async {
    String? storedToken = await storage.read(key: 'token');
    setState(() {
      isLoggedIn = storedToken != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        backgroundColor: const Color.fromARGB(255, 249, 248, 248),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: features.length,
                itemBuilder: (context, index) {
                  final feature = features[index];
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: FeatureScreen(
                      image: feature['image']!,
                      about: feature['about']!,
                      description: feature['description']!,
                    ),
                  );
                },
              ),
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: features.length,
              effect: const WormEffect(
                dotHeight: 8.0,
                dotWidth: 8.0,
                activeDotColor: Color.fromARGB(255, 62, 96, 219),
                dotColor: Color.fromARGB(255, 251, 90, 90),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => isLoggedIn
                        ? const HomeScreen()
                        : const LoginOrRegister(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                
                minimumSize: const Size(200, 50),
              ),
              child: const Text("Get Started",
              style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
