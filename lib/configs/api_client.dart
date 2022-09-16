import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;
import '../modals/modals.dart';

class ApiClient {
  final _baseUrl = 'https://quizapi.io/api/v1/questions/';
  final _apiKey = '?apiKey=j24WhINsXuMG7PszLmbkLHqRiXRoFnjRZrHxkwDa';

  Future<List<Quiz>> fetchQuiz(
      {required String category, required String difficulty}) async {
    final response =
        await http.get(Uri.parse('$_baseUrl$_apiKey&$category&$difficulty'));
    if (response.statusCode == 200) {
      final request = jsonDecode(response.body) as List;
      final listQuiz = request.map((e) => Quiz.fromJson(e)).toList();
      return listQuiz;
    } else {
      throw UnimplementedError('error');
    }
  }
  // {required ResultServer result}

  Future<void> postResult() async {

    print('инициали......');
    final docResult =
        FirebaseFirestore.instance.collection('result').doc('1234');
    print('docres произошло');
    final json = {
      'category': 'test',
      'difficulty': 'test2',
      'rightAnswer': 3,
      'notRightAnswer': 2,
      'dataQuiz': DateTime(2022, 7, 12),
      'durationQuiz': DateTime(2022, 17, 2),
    };
    await docResult.set(json);
    print('отправлись');
  }
}
