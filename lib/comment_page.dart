import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'components/input_field.dart';
import 'domain/emotion_controller.dart';
import 'domain/user_controller.dart';

final controllerProvider = Provider((ref) {
  return TextEditingController();
});

//コメント入力画面
class CommentPage extends ConsumerWidget {
  const CommentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<String, bool> emotionProvider = ref.watch(emotionsProvider);
    final List<bool> emotionList = emotionProvider.values.toList();
    final deviceWidth = MediaQuery.of(context).size.width;
    final controller = ref.read(controllerProvider);

    final userState = ref.watch(userProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('コメント入力'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InputFieldMultiLines(text: 'コメント', controller: controller),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: deviceWidth * 0.7,
              child: ElevatedButton(
                onPressed: () async {
                  final selectedIndex = emotionList.indexOf(true);
                  String selectedEmotion =
                      emotionProvider.keys.toList()[selectedIndex];

                  await userState.createReaction(
                      selectedEmotion, controller.text);

                  context.push('/');

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('リアクションの送信が完了しました。'),
                    ),
                  );
                },
                child: const Text('送信'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
