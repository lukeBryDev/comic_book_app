// To parse this JSON data, do
//
//     final issuesComicVineResponse = issuesComicVineResponseFromJson(jsonString);

import 'dart:convert';

import 'package:comic_book_app/src/features/data/models/comicVineAPI/issue_comic_vine.dart';

IssuesComicVineResponse issuesComicVineResponseFromJson(String str) =>
    IssuesComicVineResponse.fromJson(json.decode(str));

String issuesComicVineResponseToJson(IssuesComicVineResponse data) =>
    json.encode(data.toJson());

class IssuesComicVineResponse {
  final String error;
  final int limit;
  final int offset;
  final int numberOfPageResults;
  final int numberOfTotalResults;
  final int statusCode;
  final List<IssueComicVine> results;
  final String version;

  IssuesComicVineResponse({
    required this.error,
    required this.limit,
    required this.offset,
    required this.numberOfPageResults,
    required this.numberOfTotalResults,
    required this.statusCode,
    required this.results,
    required this.version,
  });

  factory IssuesComicVineResponse.fromJson(Map<String, dynamic> json) =>
      IssuesComicVineResponse(
        error: json["error"],
        limit: json["limit"],
        offset: json["offset"],
        numberOfPageResults: json["number_of_page_results"],
        numberOfTotalResults: json["number_of_total_results"],
        statusCode: json["status_code"],
        results: List<IssueComicVine>.from(
            json["results"].map((x) => IssueComicVine.fromJson(x))),
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "limit": limit,
        "offset": offset,
        "number_of_page_results": numberOfPageResults,
        "number_of_total_results": numberOfTotalResults,
        "status_code": statusCode,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "version": version,
      };
}
