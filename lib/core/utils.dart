
class Utils {
  // private constructor to prevent instantiation
  Utils._();

  // ----------- FORMAT TIMESTAMPS -----------
  static String formatTime(DateTime timestamp) {
    final now = DateTime.now();
    final diff = now.difference(timestamp);

    if (diff.inMinutes < 1) return "just now";
    if (diff.inMinutes < 60) return "${diff.inMinutes}m";
    if (diff.inHours < 24) return "${diff.inHours}h";
    if (diff.inDays < 7) return "${diff.inDays}d";

    // pretty fallback for older dates
    return DateFormat("MMM d").format(timestamp);
  }

  // ----------- TRIM TEXT SAFELY -----------
  static String limitText(String text, int max) {
    if (text.length <= max) return text;
    return "${text.substring(0, max)}...";
  }

  // ----------- RANDOM ID GENERATOR -----------
  static String randomId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  // ----------- CHECK URL OR ASSET -----------
  static bool isValidUrl(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null) return false;
    // ⭐ FIX: Removed duplicate 'https' check.
    return uri.hasScheme && (uri.scheme == 'http' || uri.scheme == 'https');
  }

  static DateFormat(String s) {}
}


