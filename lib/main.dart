import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/providers/user_provider.dart';
import 'core/providers/data_provider.dart';
import 'core/providers/chat_provider.dart';

import 'ui/app_shell.dart';

// CREATE FLOW IMPORTS
import 'ui/screens/create/create_sheet.dart';
import 'ui/screens/create/post_picker_screen.dart';
import 'ui/screens/create/camera_screen.dart';
import 'ui/screens/create/reel_record_screen.dart';
import 'ui/screens/create/live_start_screen.dart';

void main() {
  runApp(const AirifyApp());
}

class AirifyApp extends StatelessWidget {
  const AirifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => DataProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: MaterialApp(
        title: 'Airify',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.transparent,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          useMaterial3: true,
        ),
        home: const AppShell(),
        routes: {
          "/create": (_) => const CreateSheet(),
          "/create_post": (_) => const PostPickerScreen(),
          "/create_story": (_) => const CameraScreen(),
          "/create_reel": (_) => const ReelRecordScreen(),
          "/create_live": (_) => const LiveStartScreen(),
        },
      ),
    );
  }
}

