import 'package:cafe/Navigation_views/bag.dart';
import 'package:cafe/Navigation_views/favorites.dart';
import 'package:cafe/Navigation_views/home.dart';
import 'package:cafe/Navigation_views/notifications.dart';
import 'package:flutter/material.dart';
import 'package:cafe/widgets/icon_box.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainView();
}

class _MainView extends State<MainView> {
  List views = [
    const Home(),
    const Favorites(),
    const Bag(),
    const Notifications(),
  ];
  List<BottomNavigationBarItem> get items {
    return [
      BottomNavigationBarItem(
        icon: IconBox(
          icon: selectedView == 0 ? Icons.home_rounded : Icons.home_outlined,
        ),
        label: " ",
      ),
      BottomNavigationBarItem(
        icon: IconBox(
          icon:
              selectedView == 1
                  ? Icons.favorite_rounded
                  : Icons.favorite_border_rounded,
        ),
        label: " ",
      ),
      BottomNavigationBarItem(
        icon: IconBox(
          icon:
              selectedView == 2
                  ? Icons.shopping_bag
                  : Icons.shopping_bag_outlined,
        ),
        label: " ",
      ),
      BottomNavigationBarItem(
        icon: IconBox(
          icon:
              selectedView == 3
                  ? Icons.notifications_rounded
                  : Icons.notifications_none_rounded,
        ),
        label: " ",
      ),
    ];
  }

  int selectedView = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views.elementAt(selectedView),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedView,
        onTap: (value) {
          setState(() {
            selectedView = value;
          });
        },
        items: items,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed, // Prevent shifting behavior
      ),
    );
  }
}
