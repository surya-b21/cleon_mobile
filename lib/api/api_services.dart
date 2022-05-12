import 'dart:convert';

import 'package:cleon_mobile/api/user_repositories.dart';
import 'package:cleon_mobile/models/user.dart';
import 'package:cleon_mobile/utils/constant.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiServices {
  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNjM0MmY2ODM0YjEwOGQ3OTg5OGFmZWY4NjExZWMyZWUyNGU5NDFmYjM0ZGQ4NzY1NTViMDIzY2IxOWQ1MTY2MjdiZGUzMmEyMDQyNmZmNzEiLCJpYXQiOjE2NTE3MzQ4OTcuNTk0MzIzLCJuYmYiOjE2NTE3MzQ4OTcuNTk0MzI4LCJleHAiOjE2ODMyNzA4OTcuNTg5NDY3LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.OsC5kVG4cDBrduxMjbWC690oXmtQAf0KZlMb_l0ViM3i8HbjrWJRyzNHZ5fNM7pj8fWgncYPdoppc8yzUr0Qhb38QcG-Yzx7Z_HJl0o6a12Ig7FYppcLBQi4CDNFeEAqKlmxeyfY0Gg7utFEpHNsY53E1cTIHrecRCWB8ET3jjHpc7u7Cfm1HC1QRB5dnacznrVC0EWI40h42jYvFY9ZRjsjg6wYUASf5E5cNUnjGvR7pi8iDzorPxgLxVNshJRNjaDcSR6XoCwleMK2qkoOhjYltDfFAIQNTfC31koAk8mNsLeRwZiCDRaIew_T56bjf3Wxkg1hZX5f-AwvtybPFGD8urGlIKLL6L_gnkhsu9dP6pLMdiqMjk_40XjARiTktPnZsgQjlCOEB0EfqkoLXMFl8yRS14ukUi0gn7u6olf2bwY7rC82gigqbf_p0oGAJxMyG1amZoyqP-Zxo3Fuu-IrnbD2s4zJPauSO_8BwetqN4y6ZWdo4hyOUc5546VsHdIXCD33s5CNv80Dswgb3wULtOQ8mkvr6q48KeLUko0U9QX3cGbMr00nzYBQoUkOnJ6jJZZYSTdEyC2Lb0Y8enEADE2JnWIE5tvdgIrCTc6HM3pVVT8Mk6yNw_Oph-CGLA4MgqP_ug5qOwQY4O_RYe3pvgm5gIlIEUlOvmyFdic';
  void getString() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token')!;
  }

  Future<List<User>> getUser() async {
    List<User> user = <User>[];
    // getString();
    final response = await http.post(Uri.parse('$API/details'),
        headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      for (int i = 0; i < data.length; i++) {
        user.add(User.fromJson(data[i]));
      }
      return user;
    } else {
      throw Exception('Gagal Mendapatkan Data');
    }
  }
}
