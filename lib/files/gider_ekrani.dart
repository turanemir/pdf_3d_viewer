import 'package:flutter/material.dart';
import 'ozet_sayfasi.dart';

class GiderEkrani extends StatefulWidget {
  const GiderEkrani({super.key});

  @override
  State<GiderEkrani> createState() => _GiderEkraniState();
}

class _GiderEkraniState extends State<GiderEkrani> {
  final List<Map<String, String>> _giderListesi = []; // Giderler listesi
  final TextEditingController _giderAdiController = TextEditingController();
  final TextEditingController _giderMiktariController = TextEditingController();

  void _giderEkle() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Yeni Gider Ekle"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _giderAdiController,
                decoration: const InputDecoration(
                  labelText: 'Gider Adı',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _giderMiktariController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Gider Miktarı',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("İptal"),
            ),
            TextButton(
              onPressed: () {
                final giderAdi = _giderAdiController.text;
                final giderMiktari = _giderMiktariController.text;

                if (giderAdi.isNotEmpty && giderMiktari.isNotEmpty) {
                  setState(() {
                    _giderListesi.add({
                      'giderAdi': giderAdi,
                      'giderMiktari': giderMiktari,
                    });
                  });
                }

                _giderAdiController.clear();
                _giderMiktariController.clear();
                Navigator.of(context).pop();
              },
              child: const Text("Kaydet"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Giderler")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // + butonuyla gider ekleme
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _giderEkle,
                icon: const Icon(Icons.add),
                label: const Text("Yeni Gider Ekle"),
              ),
            ),
            const SizedBox(height: 20),

            // Giderlerin Listesi
            Expanded(
              child: ListView.builder(
                itemCount: _giderListesi.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _giderListesi[index]['giderAdi']!,
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          "₺${_giderListesi[index]['giderMiktari']!}",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Kaydet ve Devam Et Butonu
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const OzetSayfasi()),
                  );
                },
                child: const Text("Kaydet ve Devam Et"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
