import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/api_service.dart' as api;

final userProvider =
    StateNotifierProvider<UserState, api.ProtectedUser?>((ref) => UserState());

class UserState extends StateNotifier<api.ProtectedUser?> {
  UserState() : super(null);

  Future<void> login(String protectedId) async {
    try {
      final response = await api.login(protectedId);
      state = response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> createReaction(String emotion, String comment) async {
    try {
      if (state == null) {
        throw Exception("見守り対象者が存在しません。");
      }

      final response = await api.updateReaction(state!.id, emotion, comment);
    } catch (e) {
      throw Exception(e);
    }
  }
}
