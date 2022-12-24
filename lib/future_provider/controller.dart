import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:futureprovider/future_provider/user_model.dart';
import 'package:http/http.dart' as http;

final futureUserProvider =
    FutureProvider.family<UserModel, int>((ref, id) async {
  http.Response response =
      await http.get(Uri.parse('https://reqres.in/api/users?page=$id'));
  final dataJson = jsonDecode(response.body);
  return UserModel.fromJson(dataJson);
});
