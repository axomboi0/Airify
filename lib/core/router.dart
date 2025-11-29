// lib/core/router.dart

import 'package:flutter/material.dart';
import '../ui/screens/home_screen.dart';
import '../ui/screens/explore_screen.dart';
import '../ui/screens/chat_screen.dart';
import '../ui/screens/profile/profile_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case '/explore':
        return MaterialPageRoute(builder: (_) => const ExploreScreen());

      case '/chat':
        final username = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => ChatScreen(username: username),
        );

      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Unknown Route")),
          ),
        );
    }
  }
}
