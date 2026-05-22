// lib/main_prod.dart

import 'package:astha_it_assessment/app_config.dart';
import 'package:astha_it_assessment/core/route/route_config.dart';
import 'package:astha_it_assessment/core/route/route_name.dart';
import 'package:astha_it_assessment/data/models/book_favourite_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(BookFavouriteModelAdapter());

  await Hive.openBox<BookFavouriteModel>(
    'favorite_books',
  );

  /// PROD Flavor
  AppConfig.setFlavor(Flavor.prod);

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(440, 956),

      builder: (context, child) {
        return MaterialApp(
          title: AppConfig.appName,

          debugShowCheckedModeBanner: false,

          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
            ),
          ),

          onGenerateRoute: RouteGenerator.getRoute,

          initialRoute: RoutesName.bookListScreen,
        );
      },
    );
  }
}