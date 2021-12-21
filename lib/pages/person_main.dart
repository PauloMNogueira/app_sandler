import 'package:adam_sandler/controllers/person_controller.dart';
import 'package:adam_sandler/widgets/progress.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PersonMainPage extends StatefulWidget {
  const PersonMainPage({Key? key}) : super(key: key);

  @override
  _PersonMainPageState createState() => _PersonMainPageState();
}

class _PersonMainPageState extends State<PersonMainPage> {
  final _controller = PersonController();
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  void _initialize() async {
    setState(() {
      _controller.loading = true;
    });

    await _controller.fetchPerson();

    setState(() {
      _controller.loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(["AQUI", _controller.personModel]);
    if (_controller.personModel == null) {
      return Progress();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("AppSandler - About"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 8),
              child: Text(
                "Adam Sandler",
                key: const Key("unit_title"),
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            _buildTags({
              "Birthday": DateFormat('yyyy/MM/dd')
                  .format(_controller.personModel!.birthday)
            }),
            _buildTags(
                {"Place of Birth": _controller.personModel!.placeOfBirth}),
            _buildTags({"Homepage": _controller.personModel!.homepage}),
            _buildBody()
          ],
        ),
      ),
    );
  }

  _buildTags(Map<String, dynamic> info) {
    print([info, "INFO AQUI"]);
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Row(
        children: [
          Text(
            "${info.keys.first}: ",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            info.values.first,
            style: Theme.of(context).textTheme.subtitle1,
          )
        ],
      ),
    );
  }

  _buildBody() {
    if (_controller.loading) {
      return const Progress();
    }
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Image.network(
                "https://image.tmdb.org/t/p/w500${_controller.personModel!.profilePath}",
                height: 248,
              )),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () => print("TAP!"),
              child: Text(
                _controller.splitBiography(),
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
