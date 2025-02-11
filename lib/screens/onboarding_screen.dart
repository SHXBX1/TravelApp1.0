import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "Welcome to Our App!",
              body: "Easily manage your tasks and achieve your goals with our app.",
              image: buildImage('assets/images/onboarding3.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: "Explore Features",
              body: "Track your progress and access everything you need in just a few taps.",
              image: buildImage('assets/images/onboarding2.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: "Let’s Get Started!",
              body: "Sign up and begin your journey with us!",
              image: buildImage('assets/images/onboarding1.png'),
              decoration: getPageDecoration(),
              footer: ElevatedButton(
                onPressed: () => goToHome(context),
                child: const Text("Start Now"),
              ),
            ),
          ],
          done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: const Text("Skip"),
          next: const Icon(Icons.arrow_forward),
          dotsDecorator: getDotsDecorator(),
        ),
      ),
    );
  }

  Future<void> goToHome(BuildContext context) async {
    final prefer = await SharedPreferences.getInstance();
    await prefer.setBool("ON_BOARDING",false);

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  Widget buildImage(String path) => Center(child: Image.asset(path, width: 250));

  PageDecoration getPageDecoration() => const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 16, color: Colors.grey),
        imagePadding: EdgeInsets.all(20),
      );

  DotsDecorator getDotsDecorator() => DotsDecorator(
        size: const Size(10, 10),
        color: Colors.grey,
        activeSize: const Size(22, 10),
        activeColor: Colors.blue,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      );
}
