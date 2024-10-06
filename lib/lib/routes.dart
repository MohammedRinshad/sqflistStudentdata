import 'package:go_router/go_router.dart';
import 'package:hive_flutter/screens/home.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
