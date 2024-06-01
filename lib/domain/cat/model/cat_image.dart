class CatImage {
  String id;
  String url;

  CatImage({
    required this.id,
    required this.url
  });

  factory CatImage.fromJson(Map<String, dynamic> json) => CatImage(
    id: json["id"],
    url: json["url"],
  );
}
