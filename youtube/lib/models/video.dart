import 'dart:convert';

class Video {
  String title;
  String description;
  String thumbnail;
  String channel;
  
  Video({
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.channel,
  });
  
  Video copyWith({
    String? title,
    String? description,
    String? thumbnail,
    String? channel,
  }) {
    return Video(
      title: title ?? this.title,
      description: description ?? this.description,
      thumbnail: thumbnail ?? this.thumbnail,
      channel: channel ?? this.channel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'thumbnail': thumbnail,
      'channel': channel,
    };
  }

  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      thumbnail: map['thumbnail'] ?? '',
      channel: map['channel'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Video.fromJson(String source) => Video.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Video(title: $title, description: $description, thumbnail: $thumbnail, channel: $channel)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Video &&
      other.title == title &&
      other.description == description &&
      other.thumbnail == thumbnail &&
      other.channel == channel;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      description.hashCode ^
      thumbnail.hashCode ^
      channel.hashCode;
  }
}
