// To parse this JSON data, do
//
//     final issueDetailComicVine = issueDetailComicVineFromJson(jsonString);

import 'dart:convert';

import 'package:comic_book_app/src/features/data/models/comicVineAPI/issue_detail_volume.dart';

IssueDetailComicVine issueDetailComicVineFromJson(String str) =>
    IssueDetailComicVine.fromJson(json.decode(str));

class IssueDetailComicVine {
  final String? name;
  final String? issueNumber;
  final Image image;
  final String? description;
  final List<IssueDetailVolume> personCredits;
  final List<IssueDetailVolume> characterCredits;
  final List<IssueDetailVolume> teamCredits;
  final List<IssueDetailVolume> conceptCredits;
  final List<dynamic> locationCredits;

  /// unnecessary for this app

/*  final dynamic aliases;
  final String apiDetailUrl;
  final List<dynamic> associatedImages;
  final List<dynamic> characterDiedIn;
  final DateTime coverDate;
  final DateTime dateAdded;
  final DateTime dateLastUpdated;
  final dynamic deck;
  final dynamic firstAppearanceCharacters;
  final dynamic firstAppearanceConcepts;
  final dynamic firstAppearanceLocations;
  final dynamic firstAppearanceObjects;
  final dynamic firstAppearanceStoryarcs;
  final dynamic firstAppearanceTeams;
  final bool hasStaffReview;
  final int id;
  final List<dynamic> objectCredits;
  final String siteDetailUrl;
  final DateTime storeDate;
  final List<dynamic> storyArcCredits;
  final List<dynamic> teamDisbandedIn;
  final IssueDetailVolume volume;*/

  IssueDetailComicVine({
    required this.name,
    required this.issueNumber,
    required this.image,
    required this.description,
    required this.personCredits,
    required this.characterCredits,
    required this.teamCredits,
    required this.conceptCredits,
    required this.locationCredits,

    /// unnecessary for this app
/*    required this.aliases,
    required this.apiDetailUrl,
    required this.associatedImages,
    required this.characterCredits,
    required this.characterDiedIn,
    required this.conceptCredits,
    required this.coverDate,
    required this.dateAdded,
    required this.dateLastUpdated,
    required this.deck,
    required this.firstAppearanceCharacters,
    required this.firstAppearanceConcepts,
    required this.firstAppearanceLocations,
    required this.firstAppearanceObjects,
    required this.firstAppearanceStoryarcs,
    required this.firstAppearanceTeams,
    required this.hasStaffReview,
    required this.id,,
    required this.objectCredits,
    required this.personCredits,
    required this.siteDetailUrl,
    required this.storeDate,
    required this.storyArcCredits,
    required this.teamCredits,
    required this.teamDisbandedIn,
    required this.volume,*/
  });

  factory IssueDetailComicVine.fromJson(Map<String, dynamic> json) =>
      IssueDetailComicVine(
        characterCredits: List<IssueDetailVolume>.from(json["character_credits"]
            .map((x) => IssueDetailVolume.fromJson(x))),
        description: json["description"],
        conceptCredits: List<IssueDetailVolume>.from(
            json["concept_credits"].map((x) => IssueDetailVolume.fromJson(x))),
        image: Image.fromJson(json["image"]),
        issueNumber: json["issue_number"],
        locationCredits: List<IssueDetailVolume>.from(
            json["location_credits"].map((x) => IssueDetailVolume.fromJson(x))),
        name: json["name"],
        teamCredits: List<IssueDetailVolume>.from(
            json["team_credits"].map((x) => IssueDetailVolume.fromJson(x))),
        personCredits: List<IssueDetailVolume>.from(
            json["person_credits"].map((x) => IssueDetailVolume.fromJson(x))),

        /// unnecessary for this app
/*        aliases: json["aliases"],
        apiDetailUrl: json["api_detail_url"],
        associatedImages:
            List<dynamic>.from(json["associated_images"].map((x) => x)),

        characterDiedIn:
            List<dynamic>.from(json["character_died_in"].map((x) => x)),

        coverDate: DateTime.parse(json["cover_date"]),
        dateAdded: DateTime.parse(json["date_added"]),
        dateLastUpdated: DateTime.parse(json["date_last_updated"]),
        deck: json["deck"],
        firstAppearanceCharacters: json["first_appearance_characters"],
        firstAppearanceConcepts: json["first_appearance_concepts"],
        firstAppearanceLocations: json["first_appearance_locations"],
        firstAppearanceObjects: json["first_appearance_objects"],
        firstAppearanceStoryarcs: json["first_appearance_storyarcs"],
        firstAppearanceTeams: json["first_appearance_teams"],
        hasStaffReview: json["has_staff_review"],
        id: json["id"],
        objectCredits: List<dynamic>.from(json["object_credits"].map((x) => x)),

        siteDetailUrl: json["site_detail_url"],
        storeDate: DateTime.parse(json["store_date"]),
        storyArcCredits:
            List<dynamic>.from(json["story_arc_credits"].map((x) => x)),

        teamDisbandedIn:
            List<dynamic>.from(json["team_disbanded_in"].map((x) => x)),
        volume: IssueDetailVolume.fromJson(json["volume"]),*/
      );
}

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
  final String imageTags;

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
        imageTags: json["image_tags"],
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
        "image_tags": imageTags,
      };
}
