class IssueDetailVolume {
  final String apiDetailUrl;
  final int id;
  final String name;
  final String siteDetailUrl;
  final String? role;

  IssueDetailVolume({
    required this.apiDetailUrl,
    required this.id,
    required this.name,
    required this.siteDetailUrl,
    this.role,
  });

  factory IssueDetailVolume.fromJson(Map<String, dynamic> json) => IssueDetailVolume(
    apiDetailUrl: json["api_detail_url"],
    id: json["id"],
    name: json["name"],
    siteDetailUrl: json["site_detail_url"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "api_detail_url": apiDetailUrl,
    "id": id,
    "name": name,
    "site_detail_url": siteDetailUrl,
    "role": role,
  };
}