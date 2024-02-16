import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hohoemi_navi/data/api_service.dart';
import 'package:hohoemi_navi/domain/emotion_controller.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
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
      home: const MyHomePage(),
    );
  }
}

final backColor = StateProvider((ref) => 0xFFFFFFFF);

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<int> colors = [
      0xFFF8BBD0,
      0xFFFFCCBC,
      0xFFDCEDC8,
      0xFFB2EBF2,
      0xFF9FA8DA
    ];

    final deviceWidth = MediaQuery.of(context).size.width *0.9;
    final Map<String, bool> emotionProvider = ref.watch(emotionsProvider);
    final List<bool> emotionList = emotionProvider.values.toList();
    print(emotionList);
    return Scaffold(
      appBar: AppBar(
        title: const Text('今日の気持ち'),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ToggleButtons(
              renderBorder: false,
              fillColor: Color(ref.watch(backColor)),
              isSelected: emotionList,
              onPressed: (index) {
                ref.read(emotionsProvider.notifier).updateSelectEmotion(index);
                ref.read(backColor.notifier).state = colors[index];
              },
              children: [
                Image(image: const AssetImage('assets/very_good.png'), width: deviceWidth/5),
                Image(image: const AssetImage('assets/good.png'), width: deviceWidth/5),
                Image(image: const AssetImage('assets/average.png'), width: deviceWidth/5),
                Image(image: const AssetImage('assets/bad.png'), width: deviceWidth/5),
                Image(image: const AssetImage('assets/very_bad.png'), width: deviceWidth/5),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                final selectedIndex = emotionList.indexOf(true);
                String selectedEmotion = emotionProvider.keys.toList()[selectedIndex];
                await updateReaction(1, selectedEmotion);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
