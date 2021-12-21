import 'package:adam_sandler/controllers/movie_details_controller.dart';
import 'package:adam_sandler/widgets/progress.dart';
import 'package:flutter/material.dart';

class MovieDetailsPage extends StatefulWidget {
  final int movieId;
  const MovieDetailsPage({Key? key, required this.movieId}) : super(key: key);

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  final _controller = MovieDetailsController();

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  void _initialize() async {
    setState(() {
      _controller.loading = true;
    });
    await _controller.fetchMovie(widget.movieId);
    setState(() {
      _controller.loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_controller.movie?.title ?? ""),
      ),
      body: _buildMovieDetails(),
    );
  }

  _buildMovieDetails() {
    if (_controller.loading) {
      return const Progress();
    }
    return ListView(
      children: [
        Image.network(
            "https://image.tmdb.org/t/p/w500${_controller.movie?.backdropPath}"),
        _buildOverview()
      ],
    );
  }

  _buildOverview() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Text(
        _controller.movie!.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
