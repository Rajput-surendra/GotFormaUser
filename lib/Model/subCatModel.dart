
class GetSubcatogryModel {
  bool ?error;
  String ?message;
  List<SubCatList> data;

  GetSubcatogryModel({
    this.error,
    this.message,
    required this.data,
  });

  factory GetSubcatogryModel.fromJson(Map<String, dynamic> json) => GetSubcatogryModel(
    error: json["error"],
    message: json["message"],
    data: List<SubCatList>.from(json["data"].map((x) => SubCatList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class SubCatList {
  String? id;
  String ?name;
  String ?parentId;
  String ?slug;
  String? image;
  dynamic banner;
  String? rowOrder;
  String ?status;
  String ?clicks;

  SubCatList({
    this.id,
    this.name,
    this.parentId,
    this.slug,
    this.image,
    this.banner,
    this.rowOrder,
    this.status,
    this.clicks,
  });

  factory SubCatList.fromJson(Map<String, dynamic> json) => SubCatList(
    id: json["id"],
    name: json["name"],
    parentId: json["parent_id"],
    slug: json["slug"],
    image: json["image"],
    banner: json["banner"],
    rowOrder: json["row_order"],
    status: json["status"],
    clicks: json["clicks"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "parent_id": parentId,
    "slug": slug,
    "image": image,
    "banner": banner,
    "row_order": rowOrder,
    "status": status,
    "clicks": clicks,
  };
}
