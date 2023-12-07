import 'dart:convert';

import 'package:http/http.dart' as http;


class PosterModal{
  final String name;
  final List<dynamic> genres;
  final String langauge;
  final String image;
  final String summary;
  final String moreInfo;
  final String avgRuntime;
  final String rating;
  final String yearStarted;

  PosterModal({
    required this.name,
    required this.genres,
    required this.langauge,
    required this.image,
    required this.summary,
    required this.moreInfo,
    required this.avgRuntime,
    required this.rating,
    required this.yearStarted, 
    });
}


class HomeListModal{
  final String title;
  final String searchTerm;

  HomeListModal({
    required this.title,
    required this.searchTerm,
  });
}

class APIservice{
  static Future<List<PosterModal>> getTV(String searchTerm) async{
    var uri = searchTerm == ''?
      Uri.parse('https://api.tvmaze.com/search/shows?q=all'):
        Uri.parse('https://api.tvmaze.com/search/shows?q=$searchTerm');
    
    List<PosterModal> responses = [];
    try {
      final response = await http.get(uri);
      List<dynamic> data = jsonDecode(response.body);
        int i = 0;
        while(true){
          responses.add(
            PosterModal(
              name: data[i]['show']['name'] as String,
              genres: data[i]['show']['genres'] as List<dynamic>,
              langauge: data[i]['show']['language'] as String,
              image: data[i]['show']['image']['original'] as String,
              summary: data[i]['show']['summary'] as String,
              moreInfo: data[i]['show']['url'] as String,
              avgRuntime: data[i]['show']['averageRuntime'].toString(),
              rating: data[i]['show']['rating']['average'].toString(),
              yearStarted: data[i]['show']['premiered'].toString()
            )
          );
          i ++;
        }
    } catch(e){
      // ignore: avoid_print
      print('Error @ APIservice.getTV() : $e');
    }
    return responses;
  }
}