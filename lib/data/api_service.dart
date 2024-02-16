import 'dart:convert';

import 'package:http/http.dart' as http;


  Future<void> updateReaction(int user_id, String selectedEmotion) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3001/api/v1/users/${user_id}/reactions'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'reaction_number': selectedEmotion,
      }),
    );
    if(response.statusCode == 201){
      print('statusCode: ${response.statusCode}');
      // final jsonRes = await jsonDecode(response.body);
      // print('jsonRes: ${jsonRes.toString()}');
    }

  }