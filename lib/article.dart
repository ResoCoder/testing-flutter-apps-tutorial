class Article {
  final String title;
  final String content;

  Article({
    required this.title,
    required this.content,
  });

  Article copyWith({
    String? title,
    String? content,
  }) {
    return Article(
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  @override
  String toString() => 'Article(title: $title, content: $content)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Article && other.title == title && other.content == content;
  }

  @override
  int get hashCode => title.hashCode ^ content.hashCode;
}
