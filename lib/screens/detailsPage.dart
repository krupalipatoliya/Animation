import 'package:flutter/material.dart';
import 'package:planets/models/planet.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key, required this.planet}) : super(key: key);

  Planet planet;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF736AB7),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Container(
                height: 570,
                child: Column(
                  children: [
                    Center(
                      child: Hero(
                        tag: 'planet-icon-${widget.planet.id}',
                        child: Image(
                          image: AssetImage(widget.planet.image),
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(height: 4.0),
                        Text(widget.planet.name, style: TextStyle()),
                        Container(height: 10.0),
                        Text(widget.planet.location, style: TextStyle()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Image.asset(widget.planet.image,
                                        height: 12.0),
                                    Container(width: 8.0),
                                    Text(widget.planet.distance,
                                        style: TextStyle(),),
                                    Spacer(),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 100,
                                          child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Image.asset(widget.planet.image,
                                                    height: 12.0),
                                                Container(width: 8.0),
                                                Text(widget.planet.gravity,
                                                    style: TextStyle()),
                                              ]),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text("Overview")
                      ],

                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
