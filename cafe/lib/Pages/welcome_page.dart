import 'package:flutter/material.dart';
import 'package:cafe/Pages/main_view.dart'; // when "Get Started" is clicked, go to main view

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // use Stack to layer widgets on top of each other
      body: Stack(
        children: [
          // background image filling the entire screen
          SizedBox.expand(
            child: Image.asset('images/coffee.png', fit: BoxFit.cover),
          ),

          // avoids content getting under the notch or top/bottom safe zones
          SafeArea(
            // padding around the content
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0, // space on left and right
                vertical: 16, // space on top and bottom
              ),

              // stack children vertically
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.end, // place content on the bottom
                crossAxisAlignment:
                    CrossAxisAlignment.center, // center content horizontally
                children: [
                  // big title text
                  Text(
                    'Fall in Love with\nCoffee in Blissful\nDelight!',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.3, // line spacing between title lines
                    ),
                  ),

                  const SizedBox(
                    height: 16,
                  ), // space between title and subtitle
                  // subtitle text
                  const Text(
                    'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: 17),
                  ),

                  const SizedBox(height: 32), // space before the button
                  // Get Started button
                  SizedBox(
                    width: double.infinity, // make the button full width
                    child: ElevatedButton(
                      // on button press, go to HomePage
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainView(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD17B46),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ), // button height
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            20,
                          ), // rounded edges
                        ),
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28), // space below button
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
