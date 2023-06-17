import 'package:flutter/material.dart';
import 'package:projeto_aula/api.dart';
import 'package:projeto_aula/MovieDetail.dart';

void main() {
  runApp(MaterialApp(
    home: HomePageState(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePageState extends StatefulWidget {
  const HomePageState({super.key});

  @override
  State<HomePageState> createState() => _HomePageStateState();
}

class _HomePageStateState extends State<HomePageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getMovies(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data['Search'].length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => MovieDetail(
                                  id: snapshot.data['Search'][index]['imdbID'],
                                  img: snapshot.data['Search'][index]['Poster'],
                                )));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    child: Card(
                      color: Colors.blueGrey,
                      elevation: 30,
                      child: Stack(
                        children: [
                          Hero(
                            tag: snapshot.data['Search'][index]['imdbID'],
                            child: Image.network(
                              snapshot.data['Search'][index]['Poster'] == "N/A"
                                  ? 'https://imobzi.storage.googleapis.com/image/layout13/image-not-found.png'
                                  : snapshot.data['Search'][index]['Poster'],
                              width: 140,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 10,
                            left: MediaQuery.of(context).size.width * 0.5,
                            child:
                                Text(snapshot.data['Search'][index]['Title']),
                          ),
                          Positioned(
                            top: 30,
                            left: MediaQuery.of(context).size.width * 0.5,
                            child: Text('Movie'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
