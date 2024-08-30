class IssueComicVine {
  final dynamic aliases;
  final String apiDetailUrl;
  final DateTime coverDate;
  final DateTime dateAdded;
  final DateTime dateLastUpdated;
  final dynamic deck;
  final String? description;
  final bool hasStaffReview;
  final int id;
  final Image image;
  final List<AssociatedImage> associatedImages;
  final String issueNumber;
  final String? name;
  final String siteDetailUrl;
  final DateTime? storeDate;
  final Volume volume;

  IssueComicVine({
    required this.aliases,
    required this.apiDetailUrl,
    required this.coverDate,
    required this.dateAdded,
    required this.dateLastUpdated,
    required this.deck,
    required this.description,
    required this.hasStaffReview,
    required this.id,
    required this.image,
    required this.associatedImages,
    required this.issueNumber,
    required this.name,
    required this.siteDetailUrl,
    required this.storeDate,
    required this.volume,
  });

  factory IssueComicVine.fromJson(Map<String, dynamic> json) => IssueComicVine(
        aliases: json["aliases"],
        apiDetailUrl: json["api_detail_url"],
        coverDate: DateTime.parse(json["cover_date"]),
        dateAdded: DateTime.parse(json["date_added"]),
        dateLastUpdated: DateTime.parse(json["date_last_updated"]),
        deck: json["deck"],
        description: json["description"],
        hasStaffReview: json["has_staff_review"],
        id: json["id"],
        image: Image.fromJson(json["image"]),
        associatedImages: List<AssociatedImage>.from(
            json["associated_images"].map((x) => AssociatedImage.fromJson(x))),
        issueNumber: json["issue_number"],
        name: json["name"],
        siteDetailUrl: json["site_detail_url"],
        storeDate: json["store_date"] == null
            ? null
            : DateTime.parse(json["store_date"]),
        volume: Volume.fromJson(json["volume"]),
      );

  Map<String, dynamic> toJson() => {
        "aliases": aliases,
        "api_detail_url": apiDetailUrl,
        "cover_date":
            "${coverDate.year.toString().padLeft(4, '0')}-${coverDate.month.toString().padLeft(2, '0')}-${coverDate.day.toString().padLeft(2, '0')}",
        "date_added": dateAdded.toIso8601String(),
        "date_last_updated": dateLastUpdated.toIso8601String(),
        "deck": deck,
        "description": description,
        "has_staff_review": hasStaffReview,
        "id": id,
        "image": image.toJson(),
        "associated_images":
            List<dynamic>.from(associatedImages.map((x) => x.toJson())),
        "issue_number": issueNumber,
        "name": name,
        "site_detail_url": siteDetailUrl,
        "store_date":
            "${storeDate!.year.toString().padLeft(4, '0')}-${storeDate!.month.toString().padLeft(2, '0')}-${storeDate!.day.toString().padLeft(2, '0')}",
        "volume": volume.toJson(),
      };
}

class AssociatedImage {
  final String originalUrl;
  final int id;
  final dynamic caption;
  final ImageTags imageTags;

  AssociatedImage({
    required this.originalUrl,
    required this.id,
    required this.caption,
    required this.imageTags,
  });

  factory AssociatedImage.fromJson(Map<String, dynamic> json) =>
      AssociatedImage(
        originalUrl: json["original_url"],
        id: json["id"],
        caption: json["caption"],
        imageTags: imageTagsValues.map[json["image_tags"]]!,
      );

  Map<String, dynamic> toJson() => {
        "original_url": originalUrl,
        "id": id,
        "caption": caption,
        "image_tags": imageTagsValues.reverse[imageTags],
      };
}

enum ImageTags { ALL_IMAGES }

final imageTagsValues = EnumValues({"All Images": ImageTags.ALL_IMAGES});

class Image {
  final String iconUrl;
  final String mediumUrl;
  final String screenUrl;
  final String screenLargeUrl;
  final String smallUrl;
  final String superUrl;
  final String thumbUrl;
  final String tinyUrl;
  final String originalUrl;
  final ImageTags imageTags;

  Image({
    required this.iconUrl,
    required this.mediumUrl,
    required this.screenUrl,
    required this.screenLargeUrl,
    required this.smallUrl,
    required this.superUrl,
    required this.thumbUrl,
    required this.tinyUrl,
    required this.originalUrl,
    required this.imageTags,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        iconUrl: json["icon_url"],
        mediumUrl: json["medium_url"],
        screenUrl: json["screen_url"],
        screenLargeUrl: json["screen_large_url"],
        smallUrl: json["small_url"],
        superUrl: json["super_url"],
        thumbUrl: json["thumb_url"],
        tinyUrl: json["tiny_url"],
        originalUrl: json["original_url"],
        imageTags: imageTagsValues.map[json["image_tags"]]!,
      );

  Map<String, dynamic> toJson() => {
        "icon_url": iconUrl,
        "medium_url": mediumUrl,
        "screen_url": screenUrl,
        "screen_large_url": screenLargeUrl,
        "small_url": smallUrl,
        "super_url": superUrl,
        "thumb_url": thumbUrl,
        "tiny_url": tinyUrl,
        "original_url": originalUrl,
        "image_tags": imageTagsValues.reverse[imageTags],
      };
}

class Volume {
  final String apiDetailUrl;
  final int id;
  final String name;
  final String siteDetailUrl;

  Volume({
    required this.apiDetailUrl,
    required this.id,
    required this.name,
    required this.siteDetailUrl,
  });

  factory Volume.fromJson(Map<String, dynamic> json) => Volume(
        apiDetailUrl: json["api_detail_url"],
        id: json["id"],
        name: json["name"],
        siteDetailUrl: json["site_detail_url"],
      );

  Map<String, dynamic> toJson() => {
        "api_detail_url": apiDetailUrl,
        "id": id,
        "name": name,
        "site_detail_url": siteDetailUrl,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
