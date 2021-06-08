import 'package:flutter/material.dart';
import 'package:flutterproject/data_service.dart';
import 'package:flutterproject/models.dart';
import 'package:flutterproject/mybutton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final cityTextController = TextEditingController(); 
  final dataService = DataService();
  WeatherResponse weatherResponse;
  String status = "";

  void search() async {
    final response = await dataService.getWeather(cityTextController.text, 'metric');
    setState(() {
      if(response == null){
        status = "City not found";
      }else{
        weatherResponse = response;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical:50),
                child: SizedBox(
                  width:150,
                  child: TextField(
                    controller: cityTextController,
                    decoration: InputDecoration(labelText: 'City Name'),
                    textAlign: TextAlign.left
                  ),

                ),
              ),
              MyButton("Search", pressButton: search),
              Text(status),
              if(weatherResponse != null && weatherResponse.cityName != "")
                Column(
                  children: <Widget>[
                    Image.network(weatherResponse.iconUrl),
                    Text('${weatherResponse.tempInfo.temperature}°C', style: TextStyle(fontSize: 40)),
                    Text(weatherResponse.weatherInfo.description),
                  ],
                ),

            ],
          )
        )
      )
    );
  }
}