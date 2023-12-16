import 'dart:convert';

import 'package:restapi_with_flutterbloc/features/posts/models/post_data_ui_model.dart';
import 'package:http/http.dart' as http;
class Posts_Repo{


  static Future<List<PostDataUiModel>> fetchPosts() async{
    var client = http.Client();
    List<PostDataUiModel> posts=[];
    try {
      
        var response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
        List result = jsonDecode(response.body);
        for(int i=0; i<result.length; i++){
          PostDataUiModel post= PostDataUiModel.fromMap(result[i] as Map<String,dynamic>);
          posts.add(post);
        }
        return posts;
    } catch(e){
     print(e.toString());
     return [];
  }
  }

  static Future<bool> addposts() async{
    var client = http.Client();
    try {
      
        var response = await client.post(Uri.parse('https://jsonplaceholder.typicode.com/posts'),
          body: {
            'title': "vishal post",
            'body' : "this is a new post",
            'id' : "34",
          }
        );
        if(response.statusCode>=200 && response.statusCode<300){
          return true;
        }
        else{
          return false;
        }
        
    } catch(e){
     print(e.toString());
     return false;
  }
  }

}