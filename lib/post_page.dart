import 'package:flutter/material.dart';
import 'package:flutter_testing_tutorial/post.dart';

class PostPage extends StatelessWidget {
  final Post post;

  const PostPage({
    required this.post,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: mq.padding.top,
          bottom: mq.padding.bottom,
          left: 8,
          right: 8,
        ),
        child: Column(
          children: [
            Text(
              post.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 8),
            Text(post.content),
          ],
        ),
      ),
    );
  }
}
