import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'domain/emotion_controller.dart';

final backgroundColor = StateProvider((ref) => 0xFFFFFFFF);

//リアクション送信画面
class ReactionPage extends ConsumerWidget {
  const ReactionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<int> colors = [
      0xFFF8BBD0,
      0xFFFFCCBC,
      0xFFDCEDC8,
      0xFFB2EBF2,
      0xFF9FA8DA
    ];
    final deviceWidth = MediaQuery.of(context).size.width * 0.9;
    final Map<String, bool> emotionProvider = ref.watch(emotionsProvider);
    final List<bool> emotionList = emotionProvider.values.toList();

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
              fillColor: Color(ref.watch(backgroundColor)),
              isSelected: emotionList,
              onPressed: (index) {
                ref.read(emotionsProvider.notifier).updateSelectEmotion(index);
                ref.read(backgroundColor.notifier).state = colors[index];
              },
              children: [
                Image(
                    image: const AssetImage('assets/very_good.png'),
                    width: deviceWidth / 5),
                Image(
                    image: const AssetImage('assets/good.png'),
                    width: deviceWidth / 5),
                Image(
                    image: const AssetImage('assets/average.png'),
                    width: deviceWidth / 5),
                Image(
                    image: const AssetImage('assets/bad.png'),
                    width: deviceWidth / 5),
                Image(
                    image: const AssetImage('assets/very_bad.png'),
                    width: deviceWidth / 5),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                if (context.mounted) {
                  context.push('/comment_page');
                }

                // final selectedIndex = emotionList.indexOf(true);
                // String selectedEmotion = emotionProvider.keys.toList()[selectedIndex];
                // await updateReaction(1, selectedEmotion);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
