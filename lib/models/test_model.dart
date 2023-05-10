

class Test{
  late final String id;
  late final String title;
  late final Map<String, int> options;

  Test({
    required this.id,
    required this.title,
    required this.options,
});

  @override
  String toString() {
    return 'Question (id : $id, title: $title, options: $options)';
  }

}