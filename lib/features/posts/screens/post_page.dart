import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restapi_with_flutterbloc/features/posts/blocs/posts_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final PostsBloc postsBloc = PostsBloc();
  @override
  void initState() {
    postsBloc.add(Initialfetchevent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Post Page"),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        // floatingActionButton: FloatingActionButton(      //this is for post call of the api
        //   onPressed: () {      
        //     postsBloc.add(PostsAddevent());
        //   },
        //   child: Icon(Icons.add),
        // ),
        body: BlocConsumer<PostsBloc, PostsState>(
          bloc: postsBloc,
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return BlocConsumer<PostsBloc, PostsState>(
              bloc: postsBloc,
              listenWhen: (previous, current) => current is PostActionState,
              buildWhen: (previous, current) => current is! PostActionState,
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                switch (state.runtimeType) {
                  case PostsFetchedLoadingState:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                    break;
                  case PostsSuccessfullyFetched:
                    final successtate = state as PostsSuccessfullyFetched;
                    return ListView.builder(
                        itemCount: successtate.posts.length,
                        itemBuilder: (context, index) {
                          return Container(
                            color: Colors.grey.shade200,
                            padding: EdgeInsets.all(16),
                            margin: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(successtate.posts[index].title),
                                Text(successtate.posts[index].body)
                              ],
                            ),
                          );
                        });
                  default:
                    return const SizedBox();
                }
              },
            );
          },
        ),
      ),
    );
  }
}
