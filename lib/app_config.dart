enum Flavor {
  dev,
  prod,
}

class AppConfig {
  static late String baseUrl;

  static void setFlavor(Flavor flavor) {
    switch (flavor) {
      case Flavor.dev:
        baseUrl = 'https://www.googleapis.com/books/v1/';
        break;

      case Flavor.prod:
        baseUrl = 'https://www.googleapis.com/books/v1/';
        break;
    }
  }
}