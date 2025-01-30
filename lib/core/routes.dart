import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Ayarlar.dart';
import 'package:flutter_app/screens/Profilim.dart';
import 'package:flutter_app/screens/Notlar%C4%B1m.dart';
import 'package:flutter_app/screens/kalori_takibi.dart';
import 'package:go_router/go_router.dart';
import '../screens/loading_screen.dart';
import '../screens/home_screen.dart';

// Router yapılandırması
final router = GoRouter(
  initialLocation: '/', // Başlangıç rotası
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoadingScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/a',
      builder: (context, state) => const KaloriTakibi(),
    ),
 GoRoute(
      path: '/b',
      builder: (context, state) => const Notlarim(),
    ),
    GoRoute(
      path: '/c',
      builder: (context, state) => const Profilim(),
    ),
    GoRoute(
      path: '/d',
      builder: (context, state) => const Ayarlar (),
    ),
  
  
  ],
);


