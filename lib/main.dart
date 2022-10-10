import 'package:flutter/material.dart';
import 'package:planets/screens/detailsPage.dart';
import 'package:planets/utils/planetsList/planetsList.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Planets',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(vsync: this, duration: Duration(seconds: 2))
        ..repeat();

  static const Color appBarGradientStart = Color(0xFF3383FC);
  static const Color appBarGradientEnd = Color(0xFF00C6FF);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 60,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [appBarGradientStart, appBarGradientEnd],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(0.5, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              child: const Center(
                child: Text(
                  'Treva',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 36.0),
                ),
              ),
            ),
            Flexible(
              child: Container(
                color: const Color(0xFF8685E5),
                child: ListView.builder(
                  itemExtent: 160.0,
                  itemCount: PlanetDao.planets.length,
                  itemBuilder: (_, index) => Container(
                    height: 120.0,
                    margin: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailsPage(planet: PlanetDao.planets[index]),
                          ),
                        );
                      },
                      child: Stack(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topRight,
                            margin:
                                const EdgeInsets.only(left: 72.0, right: 24.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFF736AB7),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: const <BoxShadow>[
                                BoxShadow(
                                    color: Colors.white12,
                                    blurRadius: 10.0,
                                    offset: Offset(0.0, 10.0))
                              ],
                            ),
                            child: Container(
                              margin:
                                  const EdgeInsets.only(top: 16.0, left: 72.0),
                              constraints: const BoxConstraints.expand(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(PlanetDao.planets[index].name,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 24.0)),
                                  Text(PlanetDao.planets[index].location,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14.0)),
                                  Container(
                                      color: const Color(0xFF00C6FF),
                                      width: 24.0,
                                      height: 1.0,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8.0)),
                                  Row(
                                    children: <Widget>[
                                      const Icon(Icons.location_on,
                                          size: 14.0, color: Colors.white),
                                      Text(
                                        PlanetDao.planets[index].distance,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12.0),
                                      ),
                                      Container(width: 24.0),
                                      const Icon(Icons.flight_land,
                                          size: 14.0, color: Colors.white),
                                      Text(
                                        PlanetDao.planets[index].gravity,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12.0),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: AnimatedBuilder(
                              builder: (_, child) {
                                return Transform.rotate(
                                  angle: controller.value * math.pi * 2,
                                  child: child,
                                );
                              },
                              animation: controller,
                                child: Hero(
                                  tag:
                                      'planet-icon-${PlanetDao.planets[index].id}',
                                  child: Image(
                                    image: AssetImage(
                                        PlanetDao.planets[index].image,

                                    ),
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                              ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
