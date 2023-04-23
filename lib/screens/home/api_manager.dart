import 'dart:convert';

import 'package:http/http.dart';
import 'soccermodel.dart';

class SoccerApi {
  final String apiUrl =
      "https://api-football-v1.p.rapidapi.com/v3/fixtures?league=39&season=2021";
  static const headers = {
    'x-rapidapi-host': "api-football-v1.p.rapidapi.com",
    'x-rapidapi-key': "cede1cfa87msh2da7a5ad1d6256cp186a8ajsn2daf01f28481"
  };

  Future<List<SoccerMatch>> getAllMatches() async {
    Response res = await get(Uri.parse(apiUrl), headers: headers);
    var body;

    if (res.statusCode == 200) {
      body = jsonDecode(res.body);
      List<dynamic> matchesList = body['response'].sublist(0, 10);
      print("Api service: ${body['response']}");
      List<SoccerMatch> matches = matchesList
          .map((dynamic item) => SoccerMatch.fromJson(item))
          .toList();

      return matches;
    }
    return [];
  }
}
