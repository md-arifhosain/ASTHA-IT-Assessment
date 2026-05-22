// lib/app_config.dart

enum Flavor {
  dev,
  prod,
}

class AppConfig {
  static late Flavor flavor;

  static late String baseUrl;

  static late String appName;

  static void setFlavor(
    Flavor selectedFlavor,
  ) {
    flavor = selectedFlavor;

    switch (selectedFlavor) {
      case Flavor.dev:
        appName = 'BookBuddy Dev';

        baseUrl =
            'https://www.googleapis.com/books/v1/';

        break;

      case Flavor.prod:
        appName = 'BookBuddy';

        baseUrl =
            'https://www.googleapis.com/books/v1/';

        break;
    }
  }
}