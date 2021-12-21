import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String? posterPath;
  final Function onTap;
  final String? title;

  const MovieCard({Key? key, this.posterPath, this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () => onTap(), child: _listImage());
  }

  _listImage() {
    if (posterPath == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title!,
            style: TextStyle(fontSize: 54),
          ),
        ),
      );
    }
    return Container(
      // ignore: prefer_const_constructors
      child: FadeInImage(
        image: NetworkImage(
          'https://image.tmdb.org/t/p/w220_and_h330_face$posterPath',
        ),
        placeholder: const NetworkImage(
          'https://image.shutterstock.com/image-vector/picture-icon-image-photo-260nw-1672289161.jpg',
        ),
      ),
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: NetworkImage(
      //       'https://image.tmdb.org/t/p/w220_and_h330_face$posterPath',
      //     ),
      //     onError: (o, a)  {
      //       print("ERRO");
      //       const NetworkImage(
      //           "https://image.shutterstock.com/image-vector/picture-icon-image-photo-260nw-1672289161.jpg")
      //     },
      //     fit: BoxFit.cover,
      //   ),
      // ),
    );
  }
}
