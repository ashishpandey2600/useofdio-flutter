class UniversityModel {
  List<String>? domains;
  String? country;
  String? alphaTwoCode;
  String? stateProvince;
  List<String>? webPages;
  String? name;

  UniversityModel(
      {this.domains,
      this.country,
      this.alphaTwoCode,
      this.stateProvince,
      this.webPages,
      this.name});

  UniversityModel.fromJson(Map<String, dynamic> json) {
    domains = json['domains'].cast<String>();
    country = json['country'];
    alphaTwoCode = json['alpha_two_code'];
    stateProvince = json['state-province'];
    webPages = json['web_pages'].cast<String>();
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['domains'] = this.domains;
    data['country'] = this.country;
    data['alpha_two_code'] = this.alphaTwoCode;
    data['state-province'] = this.stateProvince;
    data['web_pages'] = this.webPages;
    data['name'] = this.name;
    return data;
  }
}
