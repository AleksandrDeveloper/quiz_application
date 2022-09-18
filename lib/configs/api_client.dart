import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<void> postResult({required ResultServer result}) async {
    String _generateRandomString(int length) {
      final _random = Random();
      const _availableChars =
          'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
      final randomString = List.generate(
          length,
          (index) =>
              _availableChars[_random.nextInt(_availableChars.length)]).join();
      return randomString;
    }

    final docResult = FirebaseFirestore.instance
        .collection('result')
        .doc('${_generateRandomString(20)}');

    await docResult.set(result.toJson());
  }
}
