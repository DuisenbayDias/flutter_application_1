import 'package:flutter/material.dart';

Map<String, int> coffeeMenu = {
  'Эспрессо': 920,
  'Капучино': 1560,
  'Латте': 1650,
  'Американо': 1150,
  'Мокко': 1370,
};

Map<String, int> dessertMenu = {
  'Чизкейк': 3260,
  'Эклер': 1360,
  'Наполеон': 2200,
};

void main() {
  showMenu();

  print('\n------ Заказ ------');

  selectCoffee('Мокко');
  selectDessert('Чизкейк');
  selectCoffee('Эспрессо-тоник');

  manageAdditions();

  print('Дополнительная плата за размер стакана: ${sizeExtraSwitch('M')}тг');

  print('Скидка: ${discountAddIf('Чизкейк')}тг');

  printReceipt('Мокко', 'Чизкейк', 'M');
}

void manageAdditions() {
  List<String> additions = ['Карамель', 'Ваниль', 'Шоколад'];

  additions.add('Соленая карамель');
  additions.remove('Ваниль');

  if (additions.contains('Карамель')) {
    print('Сладкий кофе!');
  }

  print('Добавки: ${additions.join(', ')}');
  print('Количество: ${additions.length}');
}

void showMenu() {
  print('Добро пожаловать в меню Coffee Break!');

  print('\n------ Кофе ------');

  coffeeMenu.forEach((key, value) {
    print('$key: $valueтг');
  });

  print('\n------ Десерты ------');

  dessertMenu.forEach((key, value) {
    print('$key: $valueтг');
  });
}

void selectCoffee(String coffee) {
  if (coffeeMenu.containsKey(coffee)) {
    print('Кофе: $coffee, цена: ${coffeeMenu[coffee]}тг');
  } else {
    print('Кофе "$coffee" нет в меню');
  }
}

void selectDessert(String dessert) {
  if (dessertMenu.containsKey(dessert)) {
    print('Десерт: $dessert, цена: ${dessertMenu[dessert]}тг');
  } else {
    print('Десерт "$dessert" нет в меню');
  }
}

int sizeExtraSwitch(String size) {
  switch (size) {
    case 'S':
      return 0;
    case 'M':
      return 200;
    case 'L':
      return 400;
    default:
      return 0;
  }
}

int discountAddIf(String dessert) {
  if (dessertMenu.containsKey(dessert)) {
    int price = dessertMenu[dessert]!;

    if (price > 2500) {
      return 500;
    } else {
      return 0;
    }
  } else {
    return 0;
  }
}

void printReceipt(String coffee, String dessert, String size) {
  int coffeePrice = 0;
  int dessertPrice = 0;

  if (coffeeMenu.containsKey(coffee)) {
    coffeePrice = coffeeMenu[coffee]!;
  }

  if (dessertMenu.containsKey(dessert)) {
    dessertPrice = dessertMenu[dessert]!;
  }

  int sizePrice = sizeExtraSwitch(size);
  int discount = discountAddIf(dessert);

  int total = coffeePrice + dessertPrice + sizePrice - discount;

  print('\nЧЕК:======= COFFEE BREAK =======');

  print('Кофе: $coffee: $coffeePriceтг');
  print('Десерт: $dessert: $dessertPriceтг');
  print('Размер стакана: $size');
  print('\nСкидка: $discountтг');
  print('ИТОГО: $totalтг');
  print('\n=================================');
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
