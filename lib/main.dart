import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_testing_tutorial/story_change_notifier.dart';
import 'package:flutter_testing_tutorial/story_page.dart';
import 'package:flutter_testing_tutorial/story_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Story Time',
      home: ChangeNotifierProvider(
        create: (_) => StoryChangeNotifier(StoryService()),
        child: StoryPage(),
      ),
    );
  }
}
