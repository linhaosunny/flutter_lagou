class CitysModel {
  late String name;
  late String currentCity;
  late List<String> citys;
  late List<String> historyCitys;

  CitysModel({required this.name,required this.currentCity,required this.citys,required this.historyCitys}):super();

  CitysModel.fromJson(Map data) {
    name = data["name"];
    List citylist = data["citys"];
    if (citylist != null && citylist.length > 0) {
      citys = [];
      citylist.forEach((city) {
        citys.add(city);
      });
    }
  }
}