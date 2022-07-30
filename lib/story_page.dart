import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_testing_tutorial/post_page.dart';
import 'package:flutter_testing_tutorial/story_change_notifier.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<StoryChangeNotifier>().getPosts(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Story Time'),
      ),
      body: Consumer<StoryChangeNotifier>(
        builder: (context, notifier, child) {
          if (notifier.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: notifier.posts.length,
            itemBuilder: (_, index) {
              final post = notifier.posts[index];
              return Card(
                elevation: 2,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => PostPage(post: post),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(post.title),
                    subtitle: Text(
                      post.content,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              );
            },
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 16,
            ),
          );
        },
      ),
    );
  }
}
