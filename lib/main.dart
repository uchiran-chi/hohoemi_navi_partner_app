import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hohoemi_navi_partner_app/route/route_controller.dart';

Future<void> main() async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routeProvider);

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
            color: Color(0xFFECA5B8),
            titleTextStyle:
                TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
            centerTitle: true),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(double.infinity, 40),
            textStyle:
                const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            backgroundColor: const Color(0xFFF1B3C5),
            foregroundColor: const Color(0xFFFFFFFF),
          ),
        ),
      ),
      routerConfig: router,
    );
  }
}
