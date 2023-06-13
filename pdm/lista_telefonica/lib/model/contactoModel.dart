class ContactoModel {
  final int id;
  final String name;
  final String numberPhone;
  final String emailAddress;
  ContactoModel(
      {required this.id,
      required this.name,
      required this.numberPhone,
      required this.emailAddress});

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name ?? "Sem nome",
      "numberPhone": this.numberPhone ?? "Sem número",
      "emailAddress": this.emailAddress ?? "Sem endereço",
    };
  }

  factory ContactoModel.fromJson(Map<String, dynamic> json) {
    return ContactoModel(
        id: int.parse(json["id"].toString().trim()),
        name: json["name"] ?? "",
        numberPhone: json["numberPhone"] ?? "",
        emailAddress: json["emailAddress"] ?? "");
  }

  String firstLetters() {
    String firstLetterDetected = '';
    if (name.length <= 2) return "";
    name
        .split(' ')
        .forEach((element) => firstLetterDetected += element.substring(0, 2));
    return firstLetterDetected;
  }
}
