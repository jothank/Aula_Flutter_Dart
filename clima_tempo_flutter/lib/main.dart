import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    title: 'Clima Tempo',
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => HomeScreen(),
      '/weather': (context) => WeatherScreen(),
    },
  ));
}

class HomeScreen extends StatelessWidget {
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                'https://cdn-icons-png.flaticon.com/512/831/831268.png',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20.0),
              Container(
                width: 350.0,
                height: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: _cityController,
                  decoration: InputDecoration(
                    labelText: 'Digite o nome da cidade',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  String city = _cityController.text.trim();
                  if (city.isNotEmpty) {
                    Navigator.pushNamed(
                      context,
                      '/weather',
                      arguments: city,
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Row(
                            children: [
                              Icon(
                                Icons.warning,
                                color: Colors.red,
                              ),
                              SizedBox(width: 8),
                              Text('Campo obrigatório'),
                            ],
                          ),
                          content: Text('Por favor, digite o nome da cidade.'),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.red),
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Container(
                  width: 100.0,
                  height: 40.0,
                  child: Center(
                    child: Text(
                      'Consultar',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}

// Resto do código permanece igual...

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final List<CityHistoryEntry> cityHistory = [];

  @override
  void initState() {
    super.initState();
    loadCityHistory();
  }

  void loadCityHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> history = prefs.getStringList('cityHistory') ?? [];
    setState(() {
      cityHistory.clear();
      for (final entry in history) {
        final splitEntry = entry.split('|');
        final city = splitEntry[0];
        final time = DateTime.parse(splitEntry[1]);
        cityHistory.add(CityHistoryEntry(city: city, time: time));
      }
    });
  }

  void saveCityHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> history = [];
    for (final entry in cityHistory) {
      final String entryString =
          '${entry.city}|${entry.time.toIso8601String()}';
      history.add(entryString);
    }
    prefs.setStringList('cityHistory', history);
  }

  @override
  Widget build(BuildContext context) {
    final String city = ModalRoute.of(context)!.settings.arguments as String;
    final DateTime currentTime = DateTime.now();
    cityHistory.add(CityHistoryEntry(city: city, time: currentTime));
    if (cityHistory.length > 5) {
      cityHistory.removeAt(0); // Mantém apenas as últimas 5 cidades pesquisadas
    }
    saveCityHistory();

    return Scaffold(
      appBar: AppBar(
        title: Text('Previsão do Tempo'),
      ),
      body: FutureBuilder(
        future: fetchWeatherData(city),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao carregar dados, volte e tente novamente.'),
            );
          } else {
            final weatherData = snapshot.data as WeatherData;
            final isNight =
                weatherData.weatherStatus.toLowerCase().contains('noite');
            final isRainy =
                weatherData.weatherStatus.toLowerCase().contains('chuva');
            return Container(
              decoration: BoxDecoration(
                color: isNight && isRainy ? Colors.grey[800] : Colors.white,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '${weatherData.cityName}',
                      style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                        color: isNight && isRainy ? Colors.white : Colors.black,
                      ),
                    ),
                    Text(
                      '${weatherData.currentTemperature.toStringAsFixed(1)}°C',
                      style: TextStyle(
                        fontSize: 72.0,
                        fontWeight: FontWeight.bold,
                        color: isNight && isRainy ? Colors.white : Colors.black,
                      ),
                    ),
                    Image.network(
                      weatherData.weatherIconUrl,
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      '${weatherData.weatherStatus}',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: isNight && isRainy ? Colors.white : Colors.black,
                      ),
                    ),
                    Text(
                      'Mínima: ${weatherData.minTemperature.toStringAsFixed(1)}°C',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: isNight && isRainy ? Colors.white : Colors.black,
                      ),
                    ),
                    Text(
                      'Máxima: ${weatherData.maxTemperature.toStringAsFixed(1)}°C',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: isNight && isRainy ? Colors.white : Colors.black,
                      ),
                    ),
                    Text(
                      'Chance de Chuva: ${weatherData.rainChance.toStringAsFixed(1)}%',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: isNight && isRainy ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Histórico:',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: isNight && isRainy ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Column(
                      children: cityHistory
                          .map((entry) => Text(
                                '${entry.city} - ${DateFormat('dd/MM/yyyy HH:mm:ss').format(entry.time)}',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: isNight && isRainy
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Future<WeatherData> fetchWeatherData(String city) async {
    final apiKey = '1551d80c373b0eed623c8ae11898773b';
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric&lang=pt_br';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      return WeatherData.fromJson(jsonBody);
    } else {
      throw Exception(
          'Erro ao carregar dados do clima, volte e tente novamente.');
    }
  }
}

class WeatherData {
  final String cityName;
  final String weatherStatus;
  final double currentTemperature;
  final double minTemperature;
  final double maxTemperature;
  final double rainChance;
  final String weatherIconUrl;

  WeatherData({
    required this.cityName,
    required this.weatherStatus,
    required this.currentTemperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.rainChance,
    required this.weatherIconUrl,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    final weather = json['weather'][0];
    final main = json['main'];
    return WeatherData(
      cityName: json['name'],
      weatherStatus: weather['description'],
      currentTemperature: main['temp'],
      minTemperature: main['temp_min'],
      maxTemperature: main['temp_max'],
      rainChance: json['pop'] != null ? json['pop'] * 100 : 0,
      weatherIconUrl: 'https://openweathermap.org/img/w/${weather['icon']}.png',
    );
  }
}

class CityHistoryEntry {
  final String city;
  final DateTime time;

  CityHistoryEntry({required this.city, required this.time});
}
