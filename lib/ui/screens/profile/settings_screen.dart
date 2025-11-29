import 'package:flutter/material.dart';
import '../../widgets/glass_container.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0F),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // TOP GLASS BAR
            GlassContainer(
              height: 55,
              width: double.infinity,
              borderRadius: 18,
              blur: 20,
              child: Row(
                children: [
                  const SizedBox(width: 12),

                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),

                  const SizedBox(width: 10),

                  const Text(
                    "Settings",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            _tile("Account", onTap: () {}),
            _tile("Privacy", onTap: () {}),
            _tile("Notifications", onTap: () {}),
            _tile("Theme", onTap: () {}),
            _tile("Log out", isDestructive: true, onTap: () {}),

            const SizedBox(height: 40),

            Center(
              child: Text(
                "Designed and developed by Rehan Rahman",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.35),
                  fontSize: 14,
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // GLASS TILE WIDGET -------------------------
  Widget _tile(String title,
      {bool isDestructive = false, VoidCallback? onTap}) {
    final color = isDestructive ? Colors.redAccent : Colors.white;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: onTap,
        child: GlassContainer(
          height: 65,
          width: double.infinity,
          blur: 18,
          borderRadius: 20,
          child: Row(
            children: [
              const SizedBox(width: 16),

              Icon(Icons.settings, color: color, size: 26),

              const SizedBox(width: 14),

              Text(
                title,
                style: TextStyle(color: color, fontSize: 17),
              ),

              const Spacer(),

              Icon(Icons.chevron_right, color: color.withOpacity(0.6)),
              const SizedBox(width: 12),
            ],
          ),
        ),
      ),
    );
  }
}