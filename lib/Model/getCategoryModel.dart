
class GetcatogryModel {
  bool ?error;
  String ?message;
  List<Catogary> data;

  GetcatogryModel({
     this.error,
     this.message,
    required this.data,
  });

  factory GetcatogryModel.fromJson(Map<String, dynamic> json) => GetcatogryModel(
    error: json["error"],
    message: json["message"],
    data: List<Catogary>.from(json["data"].map((x) => Catogary.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Catogary {
  String ?id;
  String ?name;
  String? parentId;
  String? slug;
  String? image;
  dynamic banner;
  String? rowOrder;
  String? status;
  String? clicks;

  Catogary({
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

  factory Catogary.fromJson(Map<String, dynamic> json) => Catogary(
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
