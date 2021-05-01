import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'data/locations.dart';
import 'package:locations/data/locations.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final locations l = new locations();

  @override
  Widget build(BuildContext context){
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title:Text('Favorite locations')),
            body: Center(
              child: ListView.builder(
                itemCount: l.listobj.length,
                itemBuilder: (context, index){
                  int number =index;
                  return GestureDetector(
                    onTap: (){ Navigator.push(context, MaterialPageRoute(builder:(context)=>SecondRoute(number,l)),);},
                    child: Card(
                        child:Column(
                            mainAxisSize: MainAxisSize.min,
                            children :<Widget> [
                              Image.network(l.listobj[index].imageUrl),
                              Text(l.listobj[index].name),
                              Text(l.listobj[index].theme),


                            ]
                        )
                    ),
                  );
                },
              ),
            )
        )
    ); }
}
// ignore: must_be_immutable
class SecondRoute extends StatelessWidget {
  int number;
  locations l;
  SecondRoute(this.number,this.l);
  @override
  //final locations l2 = new locations();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Details"),
        ),
        body: Center(
            child:Column(
                mainAxisSize: MainAxisSize.min,
                children :<Widget> [
                  Text(l.listobj[number].name),

                  Image.network(l.listobj[number].imageUrl),
                  Text(l.listobj[number].description),



                ]
            )
        ),
        floatingActionButton: FloatingActionButton( onPressed:(){
          String url=l.listobj[number].locationUrl;
          _launchURL(url);
        },


          child: const Icon(Icons.navigation),)

        );

  }
  _launchURL(String url) async {

    //String url = l.listobj[number].locationUrl;

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  }


// ignore: must_be_immutable



