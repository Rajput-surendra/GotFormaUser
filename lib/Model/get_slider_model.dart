/// error : false
/// data : [{"id":"1","type":"default","type_id":"0","image":"https://developmentalphawizz.com/goat_farm/uploads/media/2024/images_(5).jpg","date_added":"2024-01-19 15:48:41","data":[]},{"id":"2","type":"default","type_id":"0","image":"https://developmentalphawizz.com/goat_farm/uploads/media/2024/banner-03.jpg","date_added":"2024-01-19 15:48:51","data":[]},{"id":"3","type":"default","type_id":"0","image":"https://developmentalphawizz.com/goat_farm/uploads/media/2024/Goat-FAQs-Banner-Image.png","date_added":"2024-01-19 15:49:00","data":[]}]

class GetSliderModel {
  GetSliderModel({
      bool? error, 
      List<Data>? data,}){
    _error = error;
    _data = data;
}

  GetSliderModel.fromJson(dynamic json) {
    _error = json['error'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _error;
  List<Data>? _data;
GetSliderModel copyWith({  bool? error,
  List<Data>? data,
}) => GetSliderModel(  error: error ?? _error,
  data: data ?? _data,
);
  bool? get error => _error;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "1"
/// type : "default"
/// type_id : "0"
/// image : "https://developmentalphawizz.com/goat_farm/uploads/media/2024/images_(5).jpg"
/// date_added : "2024-01-19 15:48:41"
/// data : []

class Data {
  Data({
      String? id, 
      String? type, 
      String? typeId, 
      String? image, 
      String? dateAdded, 
      List<dynamic>? data,}){
    _id = id;
    _type = type;
    _typeId = typeId;
    _image = image;
    _dateAdded = dateAdded;
    _data = data;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _typeId = json['type_id'];
    _image = json['image'];
    _dateAdded = json['date_added'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(v.fromJson(v));
      });
    }
  }
  String? _id;
  String? _type;
  String? _typeId;
  String? _image;
  String? _dateAdded;
  List<dynamic>? _data;
Data copyWith({  String? id,
  String? type,
  String? typeId,
  String? image,
  String? dateAdded,
  List<dynamic>? data,
}) => Data(  id: id ?? _id,
  type: type ?? _type,
  typeId: typeId ?? _typeId,
  image: image ?? _image,
  dateAdded: dateAdded ?? _dateAdded,
  data: data ?? _data,
);
  String? get id => _id;
  String? get type => _type;
  String? get typeId => _typeId;
  String? get image => _image;
  String? get dateAdded => _dateAdded;
  List<dynamic>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    map['type_id'] = _typeId;
    map['image'] = _image;
    map['date_added'] = _dateAdded;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}