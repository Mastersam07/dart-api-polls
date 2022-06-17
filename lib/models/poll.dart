/// Poll Entity

class Poll {
  /// Creates a new poll.
  Poll({
    required this.id,
    required this.question,
    required this.createdBy,
    required this.pubDate,
  });

  /// Converts the JSON representation of a poll to a poll.
  factory Poll.fromJson(Map<String, dynamic> json) => Poll(
        id: json['id'] as String,
        question: json['question'] as String,
        createdBy: json['created_by'] as String,
        pubDate: DateTime.parse(json['pub_date'] as String),
      );

  /// The poll's ID.
  String id;

  /// The poll's title.
  String? title;

  /// The poll's description.
  String? description;

  /// The poll's questoin.
  String question;

  /// The poll's author.
  String createdBy;

  /// The poll's creation date.
  DateTime? pubDate;

  /// Converts the poll to a JSON map.
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['created_by'] = createdBy;
    data['pub_date'] = pubDate;
    return data;
  }
}
