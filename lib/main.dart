import 'package:flutter/material.dart';
import 'package:weather_app/data_service.dart';
import 'package:weather_app/models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _cityTextController = TextEditingController();
  final DataService _dataService = DataService();
  WeatherModel? _weatherModel;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_weatherModel != null)
                Column(
                  children: [
                    Image.network(_weatherModel!.iconUrl),
                    Text(
                      "${_weatherModel!.temperature} ℃",
                      style: TextStyle(fontSize: 40),
                    ),
                    Text(
                      _weatherModel!.description,
                    ),
                  ],
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: SizedBox(
                  width: 150,
                  child: TextField(
                    controller: _cityTextController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: 'City Name',
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _search,
                child: const Text('Search'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _search() async {
    final weatherData = await _dataService.getWeather(_cityTextController.text);
    setState(() => _weatherModel = weatherData);
  }
}
