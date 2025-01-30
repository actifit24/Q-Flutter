import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Theme.of(context).scaffoldBackgroundColor, // Arka plan değişiyor

      // AppBar
      appBar: AppBar(
        title:  Text('Ana Sayfa', style: Theme.of(context).textTheme.titleLarge,),
        
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

      // Ana içerik
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Ortalamak için
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        
        
          // Ekranın üst kısmına yazı ekliyoruz
          Text(
            '""Roma bir günde inşa edilmedi, her küçük adım büyük bir değişimin başlangıcıdır.""',
         style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 24)

          ),
          
          SizedBox(height: 20),
           Image.asset('assets/images/dagaçikanherif.png'),
           // Yazı ile fotoğraf  arasına boşluk ekliyoruz
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
        },
      ),
    );
  }
}
