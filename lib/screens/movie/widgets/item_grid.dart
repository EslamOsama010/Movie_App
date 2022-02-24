import 'package:flutter/material.dart';
import 'package:training/screens/movie/model.dart';

class ItemGrid extends StatelessWidget {
  List<Results> movies;
  int index;

  ItemGrid(this.movies, this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GridTile(
        child: Image.network("https://image.tmdb.org/t/p/original/" +
            movies[index].posterPath),
        footer: Container(
          height: 40,
          color: Colors.red.withOpacity(0.5),
          child: Center(
            child: Text(
              movies[index].title,
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
