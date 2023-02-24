import 'package:bhaile/controllers/bottomNavigationBarCtrl.dart';
import 'package:bhaile/view/favouriteScreen/favouriteScreen.dart';
import 'package:bhaile/view/homeScreen/homeScreen.dart';
import 'package:bhaile/view/profileScreen/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  BottomNavigationBarScreen({super.key});
  var screens = [HomeScreen(), FavouriteScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Confirm Exit'),
            content: const Text('Do you want to exit the app?'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        ) as bool;
      },
      child: SafeArea(
          child: Scaffold(
        bottomNavigationBar: Selector<BottomNavigationBarCtrl, int>(
            selector: (a, b) => b.index,
            builder: (context, index, child) {
              return BottomNavigationBar(
                  onTap: (i) =>
                      context.read<BottomNavigationBarCtrl>().changeIndex(i),
                  currentIndex: index,
                  items: [
                    BottomNavigationBarItem(
                      label: "",
                      icon: index == 0
                          ? BottomNavItem(
                              w: w,
                              icon: Icons.home_filled,
                            )
                          : Icon(
                              Icons.home_outlined,
                              size: 20,
                            ),
                    ),
                    BottomNavigationBarItem(
                      label: "",
                      icon: index == 1
                          ? BottomNavItem(
                              w: w,
                              icon: Icons.favorite,
                            )
                          : Icon(
                              Icons.favorite_outline,
                              size: 20,
                            ),
                    ),
                    BottomNavigationBarItem(
                      label: "",
                      icon: index == 2
                          ? BottomNavItem(
                              w: w,
                              icon: Icons.person,
                            )
                          : Icon(
                              Icons.person_2_outlined,
                              size: 20,
                            ),
                    )
                  ]);
            }),
        body: Selector<BottomNavigationBarCtrl, int>(
          selector: (a, b) => b.index,
          builder: (a, index, c) {
            return screens[index];
          },
        ),
      )),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.icon,
    required this.w,
  });
  final IconData icon;

  final double w;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(icon),
        CircleAvatar(
          radius: w / 150,
        )
      ],
    );
  }
}
