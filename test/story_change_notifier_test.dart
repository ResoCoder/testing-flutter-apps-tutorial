import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_tutorial/post.dart';
import 'package:flutter_testing_tutorial/story_change_notifier.dart';
import 'package:flutter_testing_tutorial/story_service.dart';
import 'package:mocktail/mocktail.dart';

class MockNewsService extends Mock implements StoryService {}

void main() {
  late StoryChangeNotifier sut;
  late MockNewsService mockNewsService;

  setUp(() {
    mockNewsService = MockNewsService();
    sut = StoryChangeNotifier(mockNewsService);
  });

  test("The initial values are correct", () {
    expect(sut.isLoading, false);
    expect(sut.posts, []);
  });

  group('getArticles', () {
    final articlesFromService = [
      Post(title: 'Test 1', content: 'Test 1 content'),
      Post(title: 'Test 2', content: 'Test 2 content'),
      Post(title: 'Test 3', content: 'Test 3 content'),
    ];
    void arrangeNewsServiceReturns3Articles() {
      when(() => mockNewsService.getPosts())
          .thenAnswer((_) async => articlesFromService);
    }

    test("gets articles using the NewsService", () async {
      arrangeNewsServiceReturns3Articles();
      await sut.getPosts();
      verify(() => mockNewsService.getPosts()).called(1);
    });

    test(
        """indicates loading of data, sets articles to the ones from the service, indicates that the data is not being loaded anymore""",
        () async {
      arrangeNewsServiceReturns3Articles();
      final future = sut.getPosts();
      expect(sut.isLoading, true);
      await future;
      expect(sut.posts, articlesFromService);
      expect(sut.isLoading, false);
    });
  });
}
