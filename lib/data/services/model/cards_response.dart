class CardResponse {
  String name;
  String urlImage;

  CardResponse({required this.name, required this.urlImage});

  static CardResponse fromJson(Map map) {
    return CardResponse(
      name: map["code"] as String,
      urlImage: map["image"] as String,
    );
  }
}
