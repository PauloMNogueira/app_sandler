import 'package:dio/dio.dart';

const kBaseUrl = 'https://api.themoviedb.org/3';
const kApiKey =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiYmY2NDFmZjM4NWZmOGU4MzJhMjkyNWM0YmJlMmQ2ZiIsInN1YiI6IjYxYmI5OGEzMjg3MjNjMDA2MTA1MGYzNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.RjsLe1hDmWwfsZ0hol744D1pwER631s01ebmIyJTLog';
const kServerError = 'Failed to connect to server. Tray again';
final kDioOptions = BaseOptions(
    baseUrl: kBaseUrl,
    connectTimeout: 5000,
    receiveTimeout: 3000,
    contentType: 'application/json;charset=utf-8',
    headers: {'Authorization': 'Bearer $kApiKey'});
