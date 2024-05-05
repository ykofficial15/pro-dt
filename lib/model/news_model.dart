// To parse this JSON data, do
//
//     final newsData = newsDataFromJson(jsonString);

import 'dart:convert';

NewsData newsDataFromJson(String str) => NewsData.fromJson(json.decode(str));

String newsDataToJson(NewsData data) => json.encode(data.toJson());

class NewsData {
    String category;
    List<Datum> data;
    bool success;

    NewsData({
        required this.category,
        required this.data,
        required this.success,
    });

    factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
        category: json["category"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "category": category,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "success": success,
    };
}

class Datum {
    String author;
    String content;
    Date date;
    String id;
    String imageUrl;
    String readMoreUrl;
    String time;
    String title;
    String url;

    Datum({
        required this.author,
        required this.content,
        required this.date,
        required this.id,
        required this.imageUrl,
        required this.readMoreUrl,
        required this.time,
        required this.title,
        required this.url,
    });

factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
        author: json["author"] ?? "",
        content: json["content"] ?? "",
        date: dateValues.map[json["date"]] ?? Date.THURSDAY_02_MAY_2024, // Provide a default value if null
        id: json["id"] ?? "",
        imageUrl: json["imageUrl"] ?? "",
        readMoreUrl: json["readMoreUrl"] ?? "",
        time: json["time"] ?? "",
        title: json["title"] ?? "",
        url: json["url"] ?? "",
    );
}


    Map<String, dynamic> toJson() => {
        "author": author,
        "content": content,
        "date": dateValues.reverse[date],
        "id": id,
        "imageUrl": imageUrl,
        "readMoreUrl": readMoreUrl,
        "time": time,
        "title": title,
        "url": url,
    };
}

enum Date {
    // ignore: constant_identifier_names
    THURSDAY_02_MAY_2024
}

final dateValues = EnumValues({
    "Thursday, 02 May, 2024": Date.THURSDAY_02_MAY_2024
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
