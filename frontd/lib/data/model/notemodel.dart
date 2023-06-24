// To parse this JSON data, do
//
//     final notes = notesFromJson(jsonString);

// import 'dart:convert';

// Notes notesFromJson(String str) => Notes.fromJson(json.decode(str));

// String notesToJson(Notes data) => json.encode(data.toJson());

class Notes {
    Notes({
        required this.status,
        required this.data,
    });

    String status;
    List<dynamic> data;

    factory Notes.fromJson(Map<String, dynamic> json) => Notes(
        status: json["status"],
        data:json['data'],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.map((e) => e.toJson()),
    };
}

class NoteData {
    NoteData({
      required this.date,
        required this.notesId,
        required this.notesTitle,
        required this.notesContent,
        required this.notesImage,
        required this.notesUsers,
    });
    String date;
    String notesId;
    String notesTitle;
    String notesContent;
    List<dynamic> notesImage;
    String notesUsers;

    factory NoteData.fromJson(Map<String, dynamic> json) => NoteData(
        date: json["date"],
        notesId: json["id"].toString(),
        notesTitle: json["title"],
        notesContent: json["content"],
        notesImage: (json["images"] is List? json["images"] : (json["images"] as String).split(",") ) ,
        notesUsers: json["user"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id": notesId,
        "title": notesTitle,
        "content": notesContent,
        "images": notesImage,
        "user": notesUsers,
        "date":date
    };
}




