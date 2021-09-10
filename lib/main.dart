import 'package:flutter/material.dart';
import 'package:yz_model_gen/json_serialize/model_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YZJonsToModel Tool',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'YZJonsToModel Tool'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController inputTextEditingController;
  late TextEditingController outputTextEditingController;
  late TextEditingController classNameTextEditingController;
  String? className;
  String? genCode;

  @override
  void initState() {
    inputTextEditingController = TextEditingController();
    outputTextEditingController = TextEditingController();
    classNameTextEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [Center(child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('Nullsafety'),
        ))],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(flex: 1, child: inputView()),
              genButton(),
              Flexible(flex: 1, child: outputView()),
            ],
          ),
        ),
      ),
    );
  }

  Widget inputView() {
    return Column(
      children: [
        Text('Json'),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          constraints: BoxConstraints(
            minHeight: 667,
            minWidth: 300,
            maxHeight: 800,
          ),
          child: TextField(
            controller: inputTextEditingController,
            maxLines: null,
            decoration: InputDecoration.collapsed(hintText: 'input Json'),
            expands: true,
          ),
        )
      ],
    );
  }

  Widget genButton() {
    return Container(
      width: 200,
      child: Column(
        children: [
          Container(
            color: Colors.black,
            alignment: Alignment.center,
            height: 44,
            child: TextField(
              controller: classNameTextEditingController,
              decoration: InputDecoration.collapsed(
                  hintText: 'input your className'),
            ),
          ),
          IconButton(
              tooltip: 'Generate',
              icon: Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
                size: 25,
              ),
              onPressed: generatorModel),
        ],
      ),
    );
  }

  Widget outputView() {
    return Column(
      children: [
        Text('Dart code'),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          constraints: BoxConstraints(
            minHeight: 667,
            minWidth: 300,
            maxHeight: 800,
          ),
          child: TextField(
            decoration: InputDecoration.collapsed(hintText: 'generate dart code'),
            controller: outputTextEditingController,
            maxLines: null,
            expands: true,
          ),
        )
      ],
    );
  }

  void generatorModel() {
    className = classNameTextEditingController.text;
    if (className == null) {
      return;
    }
    DartCode dartCode = ModelGenerator(className ?? '', false, false)
        .generateUnsafeDart(inputTextEditingController.text);
    genCode = dartCode.result;
    outputTextEditingController.text = genCode ?? '';
    print(genCode);
    setState(() {});
  }
}
