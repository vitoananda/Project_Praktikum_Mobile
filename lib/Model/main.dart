
import 'package:flutter/material.dart';
import 'MainScreen.dart';


void main() => runApp(const MyApp());


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String firstDropdownValue = 'movies';
  String secondDropdownValue = 'tvshows';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Marvel Cinematic Universe"),
            centerTitle: true,
            automaticallyImplyLeading: true,
            backgroundColor: Colors.black,
          ),
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage('assets/marvel.png'),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.all(8),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 170,
                    child: DropdownButton<String>(
                      dropdownColor: Colors.black26,
                      value: firstDropdownValue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      style: const TextStyle(color: Colors.white,fontSize: 23),
                      isExpanded : true,
                      underline: Container(
                        height: 1,
                        color: Colors.white12.withOpacity(0.5),
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          firstDropdownValue = newValue!;
                        });
                      },
                      items: <String>['movies', 'tvshows']
                          .map<DropdownMenuItem<String>>((String doaValue) {
                        return DropdownMenuItem<String>(
                          value: doaValue,
                          child: Text(doaValue),
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 9)),
                  Builder(
                    builder: (context) => ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => MainScreen(value: firstDropdownValue )));
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Continue'),
                              SizedBox(width: 10),
                              Icon(Icons.arrow_forward_ios)
                            ]
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white12,
                          padding: EdgeInsets.all(10.0),
                          fixedSize: Size(180,50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // <-- Radius
                          ),
                          side: BorderSide(color: Colors.white12, width: 2),
                          textStyle : TextStyle(fontSize: 23),
                          elevation: 15,
                        )
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 25)),
                ],
              ),
            ),
          ),
        )
    );
  }
}
