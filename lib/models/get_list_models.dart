import 'dart:convert';

GetList getListFromMap(String str) => GetList.fromMap(json.decode(str));

String getListToMap(GetList data) => json.encode(data.toMap());

class GetList {
    final Info info;
    final List<Result> results;

    GetList({
        required this.info,
        required this.results,
    });

    factory GetList.fromMap(Map<String, dynamic> json) => GetList(
        info: Info.fromMap(json["info"]),
        results: List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "info": info.toMap(),
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
    };
}

class Info {
    final int count;
    final int pages;
    final String next;
    final String prev;

    Info({
        required this.count,
        required this.pages,
        required this.next,
        required this.prev,
    });

    factory Info.fromMap(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
    );

    Map<String, dynamic> toMap() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
    };
}

class Result {
    final int id;
    final String name;
    final Status status;
    final String species;
    final String type;
    final Gender gender;
    final Location origin;
    final Location location;
    final String image;
    final List<String> episode;
    final String url;
    final DateTime created;

    Result({
        required this.id,
        required this.name,
        required this.status,
        required this.species,
        required this.type,
        required this.gender,
        required this.origin,
        required this.location,
        required this.image,
        required this.episode,
        required this.url,
        required this.created,
    });

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        status: statusValues.map[json["status"]]!,
        species: json["species"],
        type: json["type"],
        gender: genderValues.map[json["gender"]]!,
        origin: Location.fromMap(json["origin"]),
        location: Location.fromMap(json["location"]),
        image: json["image"],
        episode: List<String>.from(json["episode"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "status": statusValues.reverse[status],
        "species": species,
        "type": type,
        "gender": genderValues.reverse[gender],
        "origin": origin.toMap(),
        "location": location.toMap(),
        "image": image,
        "episode": List<dynamic>.from(episode.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
    };
}

enum Gender {
    FEMALE,
    MALE,
    UNKNOWN
}

final genderValues = EnumValues({
    "Female": Gender.FEMALE,
    "Male": Gender.MALE,
    "unknown": Gender.UNKNOWN
});

class Location {
    final String name;
    final String url;

    Location({
        required this.name,
        required this.url,
    });

    factory Location.fromMap(Map<String, dynamic> json) => Location(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
    };
}

enum Status {
    ALIVE,
    DEAD,
    UNKNOWN
}

final statusValues = EnumValues({
    "Alive": Status.ALIVE,
    "Dead": Status.DEAD,
    "unknown": Status.UNKNOWN
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
