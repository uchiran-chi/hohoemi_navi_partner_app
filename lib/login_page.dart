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
class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<String, bool> emotionProvider = ref.watch(emotionsProvider);
    final List<bool> emotionList = emotionProvider.values.toList();
    final deviceWidth = MediaQuery.of(context).size.width;
    final controller = ref.read(controllerProvider);
    final userState = ref.watch(userProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('会員検索'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InputField(text: '会員番号', controller: controller),
            SizedBox(
              width: deviceWidth * 0.7,
              child: ElevatedButton(
                onPressed: () async {
                  await userState.login(controller.text);
                  // ref.watch(reactionProvider.notifier).getReactionState(1);
                  context.push('/reaction_page');
                },
                child: const Text('ログイン'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
