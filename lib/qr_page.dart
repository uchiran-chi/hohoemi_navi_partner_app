import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'components/qr_page.dart';
import 'domain/user_controller.dart';

//会員証（QRコード）読み取り画面
class QRPage extends ConsumerWidget {
  const QRPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userProvider.notifier);

    return Scaffold(
        appBar: AppBar(
          title: const Text('QRコード'),
        ),
        body: QRCodeReader(onQRViewCreated: (String protectedId) async {
          print(protectedId);
          if (protectedId == "") {
            return;
          }

          await userState.login(protectedId);

          if (context.mounted) {
            context.pushReplacement('/reaction_page');

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('ログインが完了しました。'),
              ),
            );
          }
        }));
  }
}
