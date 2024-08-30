class GetComicsDTO {
  /// limit for page.
  final int limit;

  /// The number of elements that should be omitted or skipped from the beginning
  /// of the dataset before returning the requested results.
  final int offset;

  GetComicsDTO({required this.limit, required this.offset});

  Map<String, dynamic> toQueryParams() =>
      {'format': 'json', 'offset': offset, 'limit': limit};
}
