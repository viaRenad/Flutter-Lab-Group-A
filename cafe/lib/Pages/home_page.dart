import 'package:flutter/material.dart';
import '../widgets/coffee_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF6F6F6,
      ), // Set a light grey background for the page
      body: SafeArea(
        // Ensure UI avoids system status bars, notches, and rounded corners
        child: Padding(
          // Spacing around the content
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align children to the left
            children: [
              // Search bar and filter button in a horizontal row
              Row(
                children: [
                  // Expanded makes the search bar take up remaining space
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(
                          0.06,
                        ), // Semi-transparent background
                        borderRadius: BorderRadius.circular(
                          20,
                        ), // Rounded corners
                      ),
                      child: const TextField(
                        // TextField for entering search queries
                        decoration: InputDecoration(
                          hintText: 'Search coffee', // Placeholder text
                          border:
                              InputBorder
                                  .none, // Remove default underline border
                          icon: Icon(Icons.search), // Leading search icon
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ), // Spacing between search and filter button
                  // Filter button container
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFFD17B46), // Accent color background
                      borderRadius: BorderRadius.circular(
                        16,
                      ), // Rounded corners
                    ),
                    child: const Icon(
                      Icons.tune,
                      color: Colors.white,
                    ), // Filter icon
                  ),
                ],
              ),
              const SizedBox(height: 14), // Vertical spacing before the grid
              // Expandable grid of coffee cards
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2, // Two cards per row
                  mainAxisSpacing: 13, // Vertical spacing between rows
                  crossAxisSpacing: 11, // Horizontal spacing between columns
                  childAspectRatio: 0.67, // Width to height ratio of each card
                  children: const [
                    // Each CoffeeCard displays an image, title, subtitle, price, and rating
                    CoffeeCard(
                      imagePath: 'images/americano.png',
                      title: 'Americano',
                      subtitle: 'Smooth black espresso',
                      price: '\$2.99',
                      rating: '4.5',
                    ),
                    CoffeeCard(
                      imagePath: 'images/black_tea.png',
                      title: 'Black Tea',
                      subtitle: 'Pure & soothing',
                      price: '\$2.50',
                      rating: '4.4',
                    ),
                    CoffeeCard(
                      imagePath: 'images/matcha_latte.png',
                      title: 'Matcha Latte',
                      subtitle: 'Green tea & milk',
                      price: '\$4.95',
                      rating: '4.8',
                    ),
                    CoffeeCard(
                      imagePath: 'images/latte.png',
                      title: 'Latte',
                      subtitle: 'Espresso & steamed milk',
                      price: '\$4.25',
                      rating: '4.9',
                    ),
                    CoffeeCard(
                      imagePath: 'images/mocha.png',
                      title: 'Mocha',
                      subtitle: 'Chocolate & espresso mix',
                      price: '\$4.75',
                      rating: '4.6',
                    ),
                    CoffeeCard(
                      imagePath: 'images/cappuccino.png',
                      title: 'Cappuccino',
                      subtitle: 'Espresso with rich foam',
                      price: '\$3.99',
                      rating: '4.7',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
