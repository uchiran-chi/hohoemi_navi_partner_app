import 'dart:convert';

import 'package:http/http.dart' as http;


  Future<void> updateReaction(int userId, String selectedEmotion) async {
    try{

      print(selectedEmotion);
      final response = await http.post(
        Uri.parse('http://10.0.2.2:3001/api/v1/users/${userId}/reactions'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'reaction': selectedEmotion,
        }),
      );
      // if(response.statusCode == 201){
      print('statusCode: ${response.statusCode}');
      // final jsonRes = await jsonDecode(response.body);
      // print('jsonRes: ${jsonRes.toString()}');
      // }
    }catch(e){
      throw Exception(e);
    }
  }