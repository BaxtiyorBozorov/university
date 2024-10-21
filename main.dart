import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListView Iconlar bilan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> data = [
    {
      'title': 'Kitob',
      'subtitle': 'Adabiyot to‘plami',
      'image': 'https://via.placeholder.com/150',
      'icon': 'book'
    },
    {
      'title': 'Smartfon',
      'subtitle': 'Eng yangi model',
      'image': 'https://via.placeholder.com/150',
      'icon': 'smartphone'
    },
    {
      'title': 'Noutbuk',
      'subtitle': 'Yuqori samaradorlik',
      'image': 'https://via.placeholder.com/150',
      'icon': 'laptop'
    },
    {
      'title': 'Soat',
      'subtitle': 'Zamonaviy dizayn',
      'image': 'https://via.placeholder.com/150',
      'icon': 'watch'
    },
    {
      'title': 'Velosiped',
      'subtitle': 'Sport va sayr uchun',
      'image': 'https://via.placeholder.com/150',
      'icon': 'bike'
    },
  ];

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case 'book':
        return Icons.book;
      case 'smartphone':
        return Icons.smartphone;
      case 'laptop':
        return Icons.laptop;
      case 'watch':
        return Icons.watch;
      case 'bike':
        return Icons.pedal_bike;
      default:
        return Icons.device_unknown;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Iconlar bilan'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    data[index]['image']!,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  data[index]['title']!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(data[index]['subtitle']!),
                trailing: Icon(
                  _getIcon(data[index]['icon']!),
                  color: Colors.blueAccent,
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${data[index]['title']} bosildi')),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
