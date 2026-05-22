import 'package:astha_it_assessment/core/route/route_config.dart';
import 'package:astha_it_assessment/core/route/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
} 


class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return ScreenUtilInit(
      designSize: const Size(440, 956),
      builder: (context, child) => MaterialApp(
        title: 'ATLISS',
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
       
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),


 
        onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: RoutesName.splashRoute,
      ),
    );
  }
}