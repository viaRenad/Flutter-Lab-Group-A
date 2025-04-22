import 'package:flutter/material.dart';
import 'package:cafe/Pages/detail_page.dart';

// A card that showcases a coffee item with image, title, subtitle, price, and rating.
// Tapping it navigates to a detailed view for that coffee.
class CoffeeCard extends StatelessWidget {
  final String imagePath; // Asset path for the coffee image
  final String title; // Coffee name
  final String subtitle; // Brief description
  final String price; // Price label, e.g., "\$3.99"
  final String rating; // Rating label, e.g., "4.5"

  const CoffeeCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the DetailPage, passing along this card’s data
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => DetailPage(
                  imagePath: imagePath,
                  title: title,
                  subtitle: subtitle,
                  price: price,
                  rating: rating,
                ),
          ),
        );
      },
      child: Container(
        // White background, rounded corners, subtle border and shadow
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 9,
              offset: const Offset(0, 8), // Drop shadow for depth
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12), // Inner spacing
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image area with a rating badge overlay
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imagePath,
                      height: 155,
                      width: double.infinity,
                      fit: BoxFit.cover, // Fill box, cropping if needed
                    ),
                  ),
                  Positioned(
                    top: 7,
                    right: 7,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 4.5,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(
                          224,
                          69,
                          102,
                          11,
                        ), // Olive accent
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 14,
                            color: Color.fromARGB(255, 255, 242, 0),
                          ),
                          const SizedBox(width: 2),
                          Text(
                            rating, // Display rating value
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.3,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 11), // Space below image
              // Coffee title
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2), // Small gap
              // Coffee subtitle
              Text(
                subtitle,
                style: const TextStyle(fontSize: 13.19, color: Colors.grey),
              ),
              const SizedBox(height: 15), // Gap before price and add button
              // Price and add-to-cart row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Price label
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Add button
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD17B46), // Accent background
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.add, size: 16, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
