/*
{
   "weather":[
      {
         "description":"haze",
         "icon":"50n"
      }
   ],
   "main":{
      "temp":292.77,  
   },
   "name":"Jaipur",
}
*/
class WeatherModel {
  final String cityName;
  final double temperature;
  final String description;
  final String iconName;
  String get iconUrl {
    return 'http://openweathermap.org/img/wn/$iconName@2x.png';
  }

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.iconName,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final String cityName = json['name'];
    final double temperature = json['main']['temp'];
    final String description = json['weather'][0]['description'];
    final String iconName = json['weather'][0]['icon'];
    return WeatherModel(
        cityName: cityName,
        temperature: temperature,
        description: description,
        iconName: iconName);
  }
}
