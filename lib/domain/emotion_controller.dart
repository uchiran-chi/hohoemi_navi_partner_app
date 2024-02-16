import 'package:flutter_riverpod/flutter_riverpod.dart';

final emotionsProvider = StateNotifierProvider<EmotionsState, Map<String, bool>>((ref) => EmotionsState());

Map<String, bool> emotionMap = {
  'very_good': false,
  'good': false,
  'average': false,
  'bad': false,
  'very_bad': false,

};

class EmotionsState extends StateNotifier<Map<String, bool>>{
  EmotionsState(): super(emotionMap);


  void updateSelectEmotion(index){
    state = Map.fromEntries(state.entries.map((entry) => MapEntry(entry.key, false)));
    final keys = state.keys.toList();
    final keyToUpdate = keys[index];
    state = {...state, keyToUpdate: !state[keyToUpdate]!};
  }

}