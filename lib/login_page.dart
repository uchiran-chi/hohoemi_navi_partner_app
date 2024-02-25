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
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 130),
                child: Column(children: [
                  const Image(
                    image: AssetImage('assets/icon.png'),
                    height: 250,
                  ),
                  Text(
                    'ほほえみ Navi',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFFE84B84),
                    ),
                  ),
                  Text(
                    'for パートナー',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFFE84B84),
                    ),
                  ),
                ]),
              ),
              InputField(text: '会員番号', controller: controller),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: deviceWidth * 0.7,
                child: ElevatedButton(
                  onPressed: () async {
                    await userState.login(controller.text);
                    // ref.watch(reactionProvider.notifier).getReactionState(1);
                    context.push('/reaction_page');

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('ログインが完了しました。'),
                      ),
                    );
                  },
                  child: const Text('ログイン'),
                ),
              ),
              SizedBox(
                width: deviceWidth * 0.7,
                child: ElevatedButton(
                  onPressed: () async {
                    // await userState.login(controller.text);
                    // ref.watch(reactionProvider.notifier).getReactionState(1);
                    context.push('/qr_page');
                  },
                  child: const Text('QRコード'),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).viewInsets.bottom,
              )
            ],
          ),
        ),
      ),
    );
  }
}
