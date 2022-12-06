class Images {
  final int id;
  final String imageName;

  Images({
    required this.id,
    required this.imageName,
  });

  factory Images.fromJson(Map<String, dynamic> jsonImage) {
    return Images(
      id: jsonImage["id"],
      imageName: jsonImage["imageName"],
    );
  }
}
