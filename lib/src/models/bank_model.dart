class BancoModel{
  final Uri url;
  final String id;
  final String cnpj;
  final String name;

  BancoModel({
    required this.url,
    required this.id,
    required this.cnpj,
    required this.name
  });

  factory BancoModel.fromJSON(Map json){
    return BancoModel(
      url: Uri.parse(json['Url'] ?? ''),
      id: json['COMPE'],
      cnpj: json['Document'],
      name: json['LongName']
    );
  }

  toJson(){
    return{
      "id":id,
      "url":url,
      "cnpj":cnpj,
      "name":name,
      "icon":this.getIcon()
    };
  }

  getIcon({size=226}){
    return this.url.isAbsolute?'https://www.google.com/s2/favicons?domain=${this.url}&sz=${size}':false;
  }
}
