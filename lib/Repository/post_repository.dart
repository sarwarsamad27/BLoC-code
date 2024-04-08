import 'dart:convert';
import 'dart:io';

import 'package:check_bloc/Model/PostModel.dart';
import 'package:http/http.dart'as http;
class Repositories{
Future<List<postModel>> fetchPost()async{
  try{
    final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    if(response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((e) {
        return postModel(
          postId: e['postId'] as int,
          email: e['email'] as String,
          name: e['name'] as String,
          body: e['body'] as String,
        );
      }).toList();
    }
    }on SocketException{

  }
    throw Exception('error while fetching data ');
    }
  }

