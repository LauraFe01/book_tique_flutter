class Book {
  final String id;
  final String title;
  final List<String> authors;
  final String thumbnailUrl;

  Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.thumbnailUrl,
  });

  factory Book.fromMap(Map<String, dynamic> map) {
    final volumeInfo = map['volumeInfo'] as Map<String, dynamic>;

    return Book(
      id: map['id'] as String,
      title: volumeInfo['title'] as String? ?? 'Titolo non disponibile',
      authors: (volumeInfo['authors'] as List<dynamic>?)?.cast<String>() ?? [],
      thumbnailUrl: volumeInfo['imageLinks']?['thumbnail'] as String? ?? '',
    );
  }
}