class BancoModel{
  final Uri url;
  final String id;
  final String cnpj;
  final String name;
  final String? icon;

  BancoModel({
    required this.url,
    required this.id,
    required this.cnpj,
    required this.name,
    required this.icon
  });

  factory BancoModel.fromJSON(Map json){
    return BancoModel(
      url: Uri.parse(json['url'] ?? ''),
      id: json['id'],
      cnpj: json['cnpj'],
      name: json['name'],
      icon: json['icon'],
    );
  }

  toJson(){
    return{
      "id":id,
      "url":url,
      "cnpj":cnpj,
      "name":name,
      "icon":icon
    };
  }
}
