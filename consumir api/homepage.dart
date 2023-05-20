import 'package:api/API.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API'),
      ),
      body: FutureBuilder(
        future: getAPI(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                var product = snapshot.data['products'][index];
                var price = product['price'];
                var title = product['title'];
                var brand = product['brand'];
                var thumbnail = product['thumbnail'];

                return Card(
                  child: ListTile(
                    leading: Image.network(
                      thumbnail,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    title: Text('$title'),
                    trailing: Text('RS $price'),
                    subtitle: Text('$brand'),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

// brand
// title 
// price
// imagem 
// ****tela detalhes