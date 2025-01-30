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
      backgroundColor: Color.fromARGB(255, 28, 28, 28),
      appBar: AppBar(
        title: Text('Kalori Takibi'),
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.bell),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 200,
              color: Color.fromARGB(255, 68, 161, 160),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.person_circle,
                    size: 80,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Profilim',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            //yan menü
            ListTile(
              leading: Icon(CupertinoIcons.home),
              title: Text('Ana Sayfa'),
              onTap: () {
                Navigator.pop(context);
                context.go('/home');
              },
            ),
            ListTile(
              leading: Icon(CupertinoIcons.settings),
              title: Text('İstatistiklerim'),
              onTap: () {
                Navigator.pop(context);
                context.go('/b');
              },
            ),
            ListTile(
              leading: Icon(CupertinoIcons.chart_pie),
              title: Text('Kalori Takibi'),
              onTap: () {
                Navigator.pop(context);
                context.go("/a");
              },
            ),
          ],
        ),
      ),
      body: MacroPieChart(),
      // Alt navigasyon çubuğu
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(0, 27, 26, 26),
        selectedItemColor: Colors.amberAccent,
        unselectedItemColor: Color.fromARGB(255, 7, 255, 238),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bell),
            label: 'Kalori takibi',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.graph_square),
            label: 'istatistiklerim',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            context.go('/home');
          } else if (index == 1) {
            context.go('/a');
          } else if (index == 2) {
          } else if (index == 3) {
            context.go('/b');
          }

          // Navigasyon işlemleri buraya gelecek
        },
      ),
    );
  }
}
