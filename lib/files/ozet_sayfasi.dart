import 'package:flutter/material.dart';

class OzetSayfasi extends StatefulWidget {
  const OzetSayfasi({super.key});

  @override
  State<OzetSayfasi> createState() => _OzetSayfasiState();
}

class _OzetSayfasiState extends State<OzetSayfasi> {
  final double gelir = 15000; // Örnek gelir
  final double gider = 6200;  // Örnek gider
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showUserOptions() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Wrap(
          children: [
            ListTile(leading: const Icon(Icons.person), title: const Text("Kullanıcı İşlemleri")),
            ListTile(leading: const Icon(Icons.account_circle), title: const Text("Hesap Yönetimi")),
            ListTile(leading: const Icon(Icons.settings), title: const Text("Ayarlar")),
            ListTile(leading: const Icon(Icons.logout), title: const Text("Çıkış")),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double netButce = gelir - gider;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Özet"),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundImage: AssetImage('assets/user.png'), // Kullanıcı resmi
              radius: 16,
            ),
            onPressed: _showUserOptions,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Menü", style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            // Menü elemanları eklenecek
            ListTile(title: Text("Henüz boş")),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Toplam Gelir: ₺$gelir", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Toplam Gider: ₺$gider", style: const TextStyle(fontSize: 18)),
            const Divider(height: 40, thickness: 1.5),
            Text(
              "Bu Ayki Bütçeniz: ₺$netButce",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
