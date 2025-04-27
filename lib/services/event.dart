class Event {
  final String title;
  final DateTime createdDate;

  Event(this.title, {DateTime? createdDate})
    : createdDate = createdDate ?? DateTime.now();

  @override
  String toString() => title;
}
