import 'package:accsesible_app/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'notifier.dart';

void main() {
  runApp(
    ChangeNotifierProvider.value(
      value: ThemeStatus(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeStatus>(context, listen: true);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: provider.darkThemeEnabled ? darkTheme : lightTheme,
      home: MyHomePage(
        darkThemeEnabled: provider.darkThemeEnabled,
        title: "App",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final bool darkThemeEnabled;

  const MyHomePage({this.title, Key key, this.darkThemeEnabled})
      : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isPlaying = false;
  FlutterTts flutterTts;

  @override
  void initState() {
    super.initState();
    flutterTts = new FlutterTts();
    flutterTts.setCompletionHandler(() {
      setState(() {
        isPlaying = false;
      });
    });
  }

  Future _speak(String text) async {
    var result = await flutterTts.speak(text);
    if (result == 1) setState(() => isPlaying = true);
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => isPlaying = false);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeStatus>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          tooltip: "Change the theme",
          icon: Icon(
              widget.darkThemeEnabled ? Icons.wb_sunny : FontAwesomeIcons.moon),
          onPressed: themeProvider.changeTheme,
        ),
        actions: <Widget>[
          IconButton(
            tooltip: "Increase the font",
            icon: Icon(FontAwesomeIcons.plus),
            onPressed: themeProvider.increaseTextSize,
          ),
          IconButton(
            tooltip: "Decrease the font",
            icon: Icon(FontAwesomeIcons.minus),
            onPressed: themeProvider.decreaseTextSize,
          ),
        ],
      ),
      body: TextWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isPlaying)
            _stop();
          else
            _speak(themeProvider.stringToRead);
        },
        tooltip: isPlaying ? "Stop the speak" : "Speak the text",
        child: Icon(
          isPlaying ? FontAwesomeIcons.stop : FontAwesomeIcons.play,
        ),
      ),
    );
  }
}

class TextWidget extends StatefulWidget {
  TextWidget({Key key}) : super(key: key);

  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  String savedText = "";

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeStatus>(context, listen: true);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        minLines: 1,
        onChanged: (text) {
          setState(() {
            savedText = text;
            provider.modifyStringToRead(text);
          });
        },
        style: DefaultTextStyle.of(context).style.apply(
              fontSizeDelta: provider.textSize,
            ),
      ),
    );
  }
}
