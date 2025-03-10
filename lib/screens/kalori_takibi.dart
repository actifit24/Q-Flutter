import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_app/widgets/macropiechart.dart';


class KaloriTakibi extends StatelessWidget {
  const KaloriTakibi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Theme.of(context).scaffoldBackgroundColor, // Arka plan değişiyor
      appBar: AppBar(
        title: Text('Kalori Takibi', style: Theme.of(context).textTheme.titleLarge,),
         
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.gear),
            onPressed: () {
              context.go('/d');
            },
          ),
        ],
      ),
 
      body: MacroPieChart(),
      
      
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
    );
  }
}
