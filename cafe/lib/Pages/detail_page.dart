import 'package:flutter/material.dart';
import '../widgets/icon_box.dart';

// A page that shows detailed info about a selected coffee item, including image, description, and purchase options.
class DetailPage extends StatelessWidget {
  // Incoming data for this page: image, text, price, and rating.
  final String imagePath;
  final String title;
  final String subtitle;
  final String price;
  final String rating;

  const DetailPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      appBar: AppBar(
        backgroundColor: Colors.white, // Keep the app bar white
        centerTitle: true,
        title: const Text(
          'Detail', // Title
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(
              context,
            ); // Go back to the previous screen when tapped
          },
        ),
        actions: const [
          // A favorite heart icon on the right
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.favorite_border, color: Colors.black),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ), // Side padding for consistent layout
        child: ListView(
          children: [
            // Display the coffee image with rounded corners
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(imagePath),
            ),
            const SizedBox(height: 13),

            // Show title and subtitle with appropriate text styles
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 12),

            // A row of feature icons
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                IconBox(icon: Icons.local_shipping_outlined), // Delivery icon
                SizedBox(width: 13),
                IconBox(icon: Icons.coffee_outlined), // Coffee symbol
                SizedBox(width: 13),
                IconBox(icon: Icons.edit_outlined), // Customization/edit icon
              ],
            ),
            const SizedBox(height: 16),

            // Display the user rating with stars and review count
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 20),
                const SizedBox(width: 4),
                Text(
                  rating, // Rating passed from the previous page
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 4),
                const Text(
                  '(230)',
                  style: TextStyle(color: Colors.grey),
                ), // Static review count
              ],
            ),
            const SizedBox(height: 20),

            // Section for description with a 'Read More' link to expand content
            const Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text.rich(
              TextSpan(
                text:
                    'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. ',
                style: TextStyle(color: Colors.grey, fontSize: 14),
                children: [
                  TextSpan(
                    text: 'Read More',
                    style: TextStyle(
                      color: Color(0xFFD17B46),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom sheet for pricing and purchase call-to-action
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 45),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255), // White background
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ), // Rounded top corners only
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Price info on the left
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Price',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(
                  price, // Display the price passed in
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            // 'Buy Now' button on the right
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD17B46),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24), // Pill-shaped button
                ),
              ),
              child: const Text(
                'Buy Now',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
