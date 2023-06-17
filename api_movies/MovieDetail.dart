import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:projeto_aula/api.dart';

class MovieDetail extends StatefulWidget {
  String id;
  String img;

  MovieDetail({super.key, required this.id, required this.img});

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filme'),
      ),
      backgroundColor: Colors.grey,
      body: FutureBuilder(
        future: getMovie(widget.id),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(snapshot.data['Title'] == "N/A"
                            ? 'Titulo: Sem informação'
                            : 'Titulo: ' + snapshot.data['Title']),
                        Text(snapshot.data['Awards'] == "N/A"
                            ? 'Premiação: Sem informação'
                            : 'Premiação: ' + snapshot.data['Awards']),
                        Text(snapshot.data['Plot'] == "N/A"
                            ? 'Resumo: Sem informação'
                            : 'Resumo: ' + snapshot.data['Plot']),
                        Text(snapshot.data['Genre'] == "N/A"
                            ? 'Genero: Sem informação'
                            : 'Genero: ' + snapshot.data['Genre']),
                        Text(snapshot.data['Actors'] == "N/A"
                            ? 'Autor: Sem informação'
                            : 'Autor: ' + snapshot.data['Actors']),
                        Text(snapshot.data['Released'] == "N/A"
                            ? 'Lançado: Sem informação'
                            : 'Lançado: ' + snapshot.data['Released']),
                        Text(snapshot.data['Runtime'] == "N/A"
                            ? 'Tempo Sem informação'
                            : 'Tempo: ' + snapshot.data['Runtime']),
                        Text(snapshot.data['Writer'] == "N/A"
                            ? 'Escritor: Sem informação'
                            : 'Escritor: ' + snapshot.data['Writer']),
                        Text(snapshot.data['imdbRating'] == "N/A"
                            ? 'Nota imdb: Sem informação'
                            : 'Nota imdb: ' + snapshot.data['imdbRating']),
                        Text(snapshot.data['imdbVotes'] == "N/A"
                            ? 'Votos imdb: Sem informação'
                            : 'Votos imdb: ' + snapshot.data['imdbVotes']),
                      ],
                    ),
                    height: MediaQuery.of(context).size.height * 0.75,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: 250,
                    height: 250,
                    child: Hero(
                      tag: widget.id,
                      child: Image.network(
                        widget.img == "N/A"
                            ? 'https://imobzi.storage.googleapis.com/image/layout13/image-not-found.png'
                            : widget.img,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
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
