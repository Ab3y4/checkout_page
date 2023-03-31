import 'package:checkout_page/detail_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int quantity = 1;
late double newPrice;
List<String> potions = ['Pasta Plate', 'Ramen', 'Cheese Pasta', 'Fried Rice'];
String dropValue = 'Ramen';

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double amount(double price) {
      setState(() {
        newPrice = price * quantity;
      });
      return newPrice;
    }

    double priceOfFood() {
      if (dropValue == 'Pasta Plate') {
        return 5.00;
      } else if (dropValue == 'Ramen') {
        return 10.54;
      } else if (dropValue == 'Cheese Pasta') {
        return 9.30;
      } else {
        return 3.89;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              value: dropValue,
              items: potions
                  .map((potions) => DropdownMenuItem(
                        value: potions,
                        child: Text(
                          potions,
                          style: const TextStyle(fontSize: 25),
                        ),
                      ))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  dropValue = val!;
                });
              },
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              priceOfFood().toString(),
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      if (quantity <= 1) {
                        Exception('Value low');
                      } else {
                        quantity--;
                      }
                    });
                  },
                  child: const Icon(
                    Icons.exposure_minus_1,
                    size: 30,
                  ),
                ),
                Text(
                  quantity.toString(),
                  style: const TextStyle(fontSize: 25),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  child: const Icon(
                    Icons.exposure_plus_1,
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Text(
              amount(priceOfFood()).toString(),
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const DetailScreen();
                }));
              },
              child: const Text(
                'Next Page',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
