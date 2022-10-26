class PriceGroup {
  final String id;
  final String name;
  final String image;
  PriceGroup({required this.id, required this.name, required this.image});
  factory PriceGroup.fromJson(Map<String, dynamic> json) {
    return PriceGroup(
        id: json["id"].toString(),
        name: json["name"],
        image: json["image"] == null ? " " : json["image"]);
  }
}
