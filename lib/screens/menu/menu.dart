import 'package:flutter/material.dart';
import 'package:health/screens/menu/daily_menu.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final Map<String, List<String>> gunlukMenu = {
    'Pazartesi': ['Köfte', 'Makarna', 'Salata'],
    'Salı': ['Karnıyarık', 'Pilav', 'Yoğurt'],
    'Çarşamba': ['Kebap', 'Pilav', 'Çorba'],
    'Perşembe': ['Tavuk Şiş', 'Bulgur Pilavı', 'Meze'],
    'Cuma': ['Balık', 'Patates', 'Salata'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yemek Listesi'),
      ),
      body: ListView.builder(
        itemCount: gunlukMenu.length,
        itemBuilder: (context, index) {
          final gun = gunlukMenu.keys.elementAt(index);
          final yemekListesi = gunlukMenu[gun]!;
          return GestureDetector(
            onTap: () {
              // Burada tıklanan günün menüsüne yönlendirebilirsiniz
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DailyMenuScreen(gun: gun, menu: yemekListesi),
                ),
              );
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      gun,
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: yemekListesi
                          .map((yemek) => Text(
                                yemek,
                                style: const TextStyle(fontSize: 16.0),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
