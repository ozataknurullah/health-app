import 'package:flutter/material.dart';

class DailyMenuScreen extends StatelessWidget {
  final String gun;
  final List<String> menu;

  const DailyMenuScreen({Key? key, required this.gun, required this.menu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Tüm yemeklerin kcal değerlerini hesaplayıp toplamını bulalım
    int toplamKcal = 0;
    for (var yemek in menu) {
      toplamKcal += _calculateKcal(yemek);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('$gun Menüsü'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
              'Kcal: $toplamKcal kcal',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (context, index) {
          final yemek = menu[index];
          final kcal =
              _calculateKcal(yemek); // Yemeğin kcal değerini hesaplayalım
          return ListTile(
            title: Text(yemek),
            subtitle: Text('$kcal kcal'),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: const Text(
            'Asistan Destek Alanı',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // Basit bir şekilde yemek adına göre rastgele bir kcal değeri döndüren bir fonksiyon
  int _calculateKcal(String yemek) {
    // Burada yemek adına göre rastgele bir kcal değeri döndürebilirsiniz
    // Örneğin, yemek adının uzunluğunu baz alabilirsiniz
    return yemek.length * 50;
  }
}
