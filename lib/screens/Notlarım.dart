import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class Notlarim extends StatefulWidget {
  const Notlarim({super.key});

  @override
  State<Notlarim> createState() => _NotlarimState();
}

class _NotlarimState extends State<Notlarim> {
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Notlarım'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _noteController,
          maxLines: null, // Kullanıcı istediği kadar satır ekleyebilir
          keyboardType: TextInputType.multiline, // Çok satırlı yazı girişi
          decoration: InputDecoration(
            hintText: 'Buraya notunuzu yazın',
            hintStyle: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),
            border: InputBorder.none, // Kenarlık yok
          ),
          style: Theme.of(context).textTheme.bodyLarge, // Gece/gündüz moduna uyumlu yazı rengi
        ),
      ),
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