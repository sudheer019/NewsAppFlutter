import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'News_Info.dart';

enum NewsActions { Fetch, Delete }

class NewsBloc {
  final _stateStreamController = StreamController<List<Articles>>();
  StreamSink<List<Articles>> get counterSink => _stateStreamController.sink;
  Stream<List<Articles>> get counterStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<NewsActions>();
  StreamSink<NewsActions> get eventSink => _eventStreamController.sink;
  Stream<NewsActions> get _eventStream => _eventStreamController.stream;

  NewsBloc() {
    _eventStream.listen((event) {
      if (event == NewsActions.Fetch) {}
    });
  }

  Future<TechArticles> getNews() async {
    var client = http.Client();
    var newsModel;

    try {
      var response = await client.get(
          "http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=e23f1c9b8dcc447ab0c227c737e0a13c");
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = TechArticles.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }
}
