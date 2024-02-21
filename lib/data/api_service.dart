import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> updateReaction(
    int id, String selectedEmotion, String comment) async {
  try {
    print(selectedEmotion);
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3001/api/v1/users/${id}/reactions'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'reaction': selectedEmotion,
        'comment': comment,
      }),
    );
    // if(response.statusCode == 201){
    print('statusCode: ${response.statusCode}');
    // final jsonRes = await jsonDecode(response.body);
    // print('jsonRes: ${jsonRes.toString()}');
    // }
  } catch (e) {
    throw Exception(e);
  }
}

class ProtectedUser {
  final int id;
  final String protectedName;

  ProtectedUser({required this.id, required this.protectedName});

  // ファクトリメソッド
  factory ProtectedUser.fromJson(Map<String, dynamic> json) {
    return ProtectedUser(
      id: json['id'],
      protectedName: json['protected_name'],
    );
  }
}

Future<ProtectedUser> login(String protectedId) async {
  try {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3001/api/v1/watchers/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'protected_id': protectedId,
      }),
    );
    // if(response.statusCode == 201){
    print('statusCode: ${response.statusCode}');
    // final jsonRes = await jsonDecode(response.body);
    // print('jsonRes: ${jsonRes.toString()}');
    // }

    ProtectedUser user = ProtectedUser.fromJson(jsonDecode(response.body));

    return user;
  } catch (e) {
    throw Exception(e);
  }
}
