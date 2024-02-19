import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../reaction_page.dart';

//会員証（QRコード）読み取り画面
class QRPage extends ConsumerWidget {
  const QRPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: const Center()
    );
  }
}
