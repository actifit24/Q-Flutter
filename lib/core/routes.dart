import 'package:flutter/material.dart';
import 'package:flutter_app/screens/istatistiklerim.dart';
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
      builder: (context, state) => const Istatistiklerim(),
    ),
  
  ],
);


