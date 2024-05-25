import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prak8/detailPage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'food_menu.dart';
import 'cart_item.dart';
import 'cart_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Selamat datang di Praktikum Flutter!'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                 MaterialPageRoute(builder: (context) => const
MenuPage()),
                 );
              },
              child: const Text('Menu'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                 MaterialPageRoute(builder: (context) => AboutPage()),
                 );
              },
              child: const Text('About'),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // Daftar contoh menu makanan
  List<FoodMenu> foodMenus = [
    FoodMenu(imageUrl: 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-4.0.3&ixid', name: 'Pasta', price: 150),
    FoodMenu(imageUrl: 'https://images.unsplash.com/photo-1676300185292-e23bb3db50fa?ixlib=rb-4.0.3&ixid', name: 'Beef Bourguignon', price: 220),
    FoodMenu(imageUrl: 'https://images.unsplash.com/photo-1621841957884-1210fe19d66d?ixlib=rb-4.0.3&ixid', name: 'Seafood Paella', price: 250),
    FoodMenu(imageUrl: 'https://images.unsplash.com/photo-1550675897-2505803ba4c0?ixlib=rb-4.0.3&ixid', name: 'Pastel de Nata', price: 200),
    FoodMenu(imageUrl: 'https://images.unsplash.com/photo-1601702538934-efffab67ab65?ixlib=rb-4.0.3&ixid', name: 'Peakle Herring', price: 100),
    FoodMenu(imageUrl: 'https://images.unsplash.com/photo-1623961988350-66b064cb2977?ixlib=rb-4.0.3&ixid', name: 'Carpaccio', price: 260),
  ];

  List<CartItem> cartItems = [];

    // Fungsi untuk menambahkan menu ke keranjang
  void addToCart(FoodMenu foodMenu) {
    bool found = false;
    for (var item in cartItems) {
      if (item.foodMenu == foodMenu) {
        item.quantity++;
        found = true;
        break;
      }
    }

    if (!found) {
      cartItems.add(CartItem(foodMenu: foodMenu));
    }

    setState(() {});
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage(cartItems: cartItems)),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: foodMenus.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MenuDetailPage(
                    foodMenu: foodMenus[index],
                    cartItems: cartItems,
                    addToCart: addToCart,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 5.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(
                      foodMenus[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          foodMenus[index].name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('\$${foodMenus[index].price.toStringAsFixed(2)}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage(cartItems: cartItems)),
          );
        },
        label: Text('Lihat Keranjang'),
        icon: Icon(Icons.shopping_cart),
      ),
    );
  }
}

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>{
  String restaurantExteriorUrl = 
  'https://images.unsplash.com/photo-1587899897387-091ebd01a6b2?ixlib=rb-4.0.3&ixid=MnwxMjA3';
  String restaurantInteriorUrl = 
  'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-4.03&ixid=MnwxMjA3';
  String restaurantName = 'Italy Restourant';
  String restaurantLocation = 'Jl. Pangeran Asogiri No. 17, Bogor, Jawa Barat, Indonesia';
  String mapsUrl = 'https://maps.google.com/?q=-6.200000,106.816666';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restaurantName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Foto Luar Restoran: '),
            SizedBox(height: 8),
            Image.network(restaurantExteriorUrl),
            SizedBox(height: 16),
            Text('Foto Interior Restoran: '),
            SizedBox(height: 8),
            Image.network(restaurantInteriorUrl),
            SizedBox(height: 16),
            Text(
              'Lokasi: ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(restaurantLocation),
            SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () async {
                await launch(mapsUrl);
              },
              icon: Icon(Icons.map),
              label: Text("Buka di Google Maps"),
            )
          ],
          ),
        ),
      ),
    );
  }
}

  void _launchMaps() async {
    const url = 'https://www.google.com/maps/search/?api=1&query=Jl.+Contoh+No.+123,+Kota+Contoh';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
