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

  String getIcon({int size = 226}) {
    final apiUrl = this.url.isAbsolute
        ? 'https://t3.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=${this.url}&size=16'
        : '';
    return apiUrl;
  }
}
