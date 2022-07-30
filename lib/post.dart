class Post {
  final String title;
  final String content;

  Post({
    required this.title,
    required this.content,
  });

  Post copyWith({
    String? title,
    String? content,
  }) {
    return Post(
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  @override
  String toString() => 'Post(title: $title, content: $content)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Post && other.title == title && other.content == content;
  }

  @override
  int get hashCode => title.hashCode ^ content.hashCode;
}
