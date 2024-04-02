import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isFavorited = false;
  bool _isCall = false;
  bool _isDirections = false;
  bool _isLocation = false;

  int _favoriteCount = 0;
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
      } else {
        _favoriteCount += 1;
      }
      _isFavorited = !_isFavorited;
    });
  }

  void _makeCall() {
    setState(() {
      _isCall = !_isCall;
    });
  }

  void _showDirections() {
    setState(() {
      _isDirections = ! _isDirections;
    });
  }

  void _shareLocation() {
    setState(() {
      _isLocation = !_isLocation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Общежитие КубГАУ'),
        backgroundColor: Colors.green, // цвет верхней панели
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.network('https://i3.photo.2gis.com/images/branch/23/3236962275324211_032f.jpg'), // изображение по ссылке
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Общежитие №20',
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Краснодар, ул. Калинина, 13',
                style: TextStyle(color: Colors.grey), // серый цвет текста
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Студенческий городок или так называемый кампус Кубанского ГАУ состоит из двадцати общежитий, в которых проживает более 8000 студентов, что составляет 96% от всех нуждающихся. Студенты первого курса обеспечены местами в общежитии полностью. В соответствии с Положением о студенческих общежитиях университета, при поселении между администрацией и студентами заключается договор найма жилого помещения. Воспитательная работа в общежитиях направлена на улучшение быта, соблюдение правил внутреннего распорядка, отсутствия асоциальных явлений в молодежной среде. Условия проживания в общежитиях университетского кампуса полностью отвечают санитарным нормам и требованиям: наличие оборудованных кухонь, душевых комнат, прачечных, читальных залов, комнат самоподготовки, помещений для заседаний студенческих советов и наглядной агитации. С целью улучшения условий быта студентов активно работает система студенческого самоуправления - студенческие советы организуют всю работу по самообслуживанию.',
                textAlign: TextAlign.justify,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.phone, color: _isCall ? Colors.green : Colors.grey),
                  onPressed: _makeCall,
                ),
                IconButton(
                  icon:  Icon(Icons.directions, color: _isDirections ? Colors.green : Colors.grey),
                  onPressed: _showDirections,
                ),
                IconButton(
                  icon: Icon(Icons.share, color: _isLocation ? Colors.green : Colors.grey),
                  onPressed: _shareLocation,
                ),
                IconButton(
                  icon: Icon(Icons.favorite, color: _isFavorited ? Colors.red : Colors.grey), // цвет сердечка
                  onPressed: _toggleFavorite,
                ),
                Text('$_favoriteCount' ), // отображение счетчика
              ],
            ),
          ],
        ),
      ),
    );
  }
}