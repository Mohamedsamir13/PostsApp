import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:postsapp/Core/Erorrs/exceptions.dart';
import 'package:postsapp/Featurs/posts/data/models/postmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<List<PostModel>> getCashedPosts();

  Future<Unit> cashePosts(List<PostModel> postmodel);
}
const CashedPost="CASHED_POSTS";

class PostLocalImpl implements LocalDataSource {
  @override
  final SharedPreferences sharedPreferences;

  PostLocalImpl({required this.sharedPreferences});

  Future<Unit> cashePosts(List<PostModel> postmodel) {
    List PostModelToJson = postmodel
        .map<Map<String, dynamic>>((PostModel) => PostModel.toJson())
        .toList();
    sharedPreferences.setString(CashedPost, json.encode(PostModelToJson));
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getCashedPosts() {
    final jsonToString = sharedPreferences.getString(CashedPost);
    if (jsonToString != null) {
      List decodeJsonData = json.decode(jsonToString);
      List<PostModel> josnToPostModels = decodeJsonData.map<PostModel>((
          josnToPostModels) => PostModel.fromJson(josnToPostModels)).toList();
      return Future.value(josnToPostModels);

    }
    else{
      throw EmptyCashException();
    }
  }
}
