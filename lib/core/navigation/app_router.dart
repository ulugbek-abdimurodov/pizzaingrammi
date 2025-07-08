import 'package:flutter/material.dart';
import '../../features/home/presentation/home_view.dart';
import '../../features/menu/presentation/menu_view.dart';
import '../../features/details/presentation/details_view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeView());
      case '/menu':
        return MaterialPageRoute(builder: (_) => const MenuView());
      case '/details':
        return MaterialPageRoute(builder: (_) => const DetailsView());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
} 