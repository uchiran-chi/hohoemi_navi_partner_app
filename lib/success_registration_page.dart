import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'domain/emotion_controller.dart';

final controllerProvider = Provider((ref) {
  return TextEditingController();
});

//コメント入力画面
class SuccessRegistrationPage extends ConsumerWidget {
  const SuccessRegistrationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<String, bool> emotionProvider = ref.watch(emotionsProvider);
    final List<bool> emotionList = emotionProvider.values.toList();
    final deviceWidth = MediaQuery.of(context).size.width;
    final controller = ref.read(controllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('登録完了'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('ご登録ありがとうございました！'),
            SizedBox(
              width: deviceWidth * 0.7,
              child: ElevatedButton(
                onPressed: () async {
                  context.push('/');
                },
                child: const Text('会員検索に戻る'),
              ),
            ),
          ],
        ),
      ),
      // body: Center(
      //   child: Column(children: <Widget>[
      //     const TextField(
      //         autofocus: true,
      //         decoration: InputDecoration(
      //             border: InputBorder.none, hintText: 'Enter a search term')),
      //     ElevatedButton(
      //       onPressed: () async {
      //         final selectedIndex = emotionList.indexOf(true);
      //         String selectedEmotion =
      //             emotionProvider.keys.toList()[selectedIndex];
      //         await updateReaction(1, selectedEmotion);
      //       },
      //       child: const Text('OK'),
      //     ),
      //   ]),
      // ),
    );
  }
}
