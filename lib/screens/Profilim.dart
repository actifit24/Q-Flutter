import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart';

class Profilim extends StatefulWidget {
  const Profilim({super.key});

  @override
  State<Profilim> createState() => _ProfilimState();
}

class _ProfilimState extends State<Profilim> {
  // Kullanıcıdan alınacak veriler için controller'lar
  final TextEditingController _adController = TextEditingController();
  final TextEditingController _soyadController = TextEditingController();
  final TextEditingController _dogumTarihiController = TextEditingController();
  final TextEditingController _kiloController = TextEditingController();
  final TextEditingController _boyController = TextEditingController();

  // Kaydedilen verileri ekranda göstermek için değişkenler
  String ad = "";
  String soyad = "";
  String dogumTarihi = "";
  String kilo = "";
  String boy = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor, // Arka plan değişiyor
       // AppBar
      appBar: AppBar(
        title: const Text('Profilim'),
        centerTitle: true,      
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.gear),
            onPressed: () {
              context.go('/d');
            },
          ),
        ],
      ),
     
       // Alt navigasyon çubuğu
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chart_bar_circle),
            label: 'Kalori takibi',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.pen),
            label: 'Notlarım',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            context.go('/home');
          } else if (index == 1) {
            context.go('/a');
          } else if (index == 2) {
            context.go('/c');
          } else if (index == 3) {
            context.go('/b');
          }

          // Navigasyon işlemleri buraya gelecek
        },
      ),
     
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            // Kullanıcıdan giriş alma
            _buildTextField("Ad", _adController),
            _buildTextField("Soyad", _soyadController),
            _buildTextField("Doğum Tarihi", _dogumTarihiController,
                isNumber: true),
            _buildTextField("Kilo", _kiloController, isNumber: true),
            _buildTextField("Boy", _boyController, isNumber: true),

            SizedBox(height: 20),

            // Kaydet Butonu
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    ad = _adController.text;
                    soyad = _soyadController.text;
                    dogumTarihi = _dogumTarihiController.text;
                    kilo = _kiloController.text;
                    boy = _boyController.text;
                  });
                },
                child: Text("Kaydet"),
              ),
            ),

            SizedBox(height: 20),

            // Kullanıcının girdiği bilgileri gösterme alanı
            if (ad.isNotEmpty)
             _buildInfoRow("Ad", ad),
            if (soyad.isNotEmpty)
             _buildInfoRow("Soyad", soyad),
            if (dogumTarihi.isNotEmpty) 
            _buildInfoRow("Doğum Tarihi", dogumTarihi),
            if (kilo.isNotEmpty) 
            _buildInfoRow("Kilo", kilo + " kg"),
            if (boy.isNotEmpty) 
            _buildInfoRow("Boy", boy + "cm"),
          ],
        ),
        
      ),
    );
  }

  // Metin giriş alanı
  Widget _buildTextField(String label, TextEditingController controller,
      {bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        inputFormatters: isNumber
            ? [FilteringTextInputFormatter.digitsOnly] // Sadece rakam
            : [],
       style: Theme.of(context).textTheme.titleLarge,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.onSurface,),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide( color: Theme.of(context).colorScheme.primary,),
          ),
        ),
      ),
    );
  }

  // Kullanıcının girdiği bilgileri göstermek için satır
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        "$label: $value",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
