import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Carto extends StatefulWidget {
  const Carto({Key? key}) : super(key: key);

  @override
  _Carto createState() => _Carto();
}

class _Carto extends State<Carto> {
  List<Marker> _markers = [
    Marker(
      point: LatLng(44.657978, -1.145238),
      width: 40,
      height: 40,
      builder: (context) =>
          Icon(color: Color.fromARGB(255, 227, 15, 0), size: 40, Icons.sailing),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    void handlePressed(LatLng latLng) {
      var markerIndex =
          _markers.indexWhere((element) => element.point == latLng);

      if (markerIndex != -1) {
        print(markerIndex);
        setState(() {
          _markers.removeAt(markerIndex);
        });
      }
    }

    void handleTap(LatLng latLng) {
      setState(() {
        _markers.add(
          Marker(
              width: 40.0,
              height: 40.0,
              point: latLng,
              builder: (ctx) => IconButton(
                    onPressed: () {
                      handlePressed(latLng);
                    },
                    icon: Icon(Icons.sailing, size: 40, color: Colors.green),
                  )),
        );
      });
    }

    return ListView(
      children: [
        Center(
          child: Container(
            // red circle
            decoration: BoxDecoration(
              color: Colors.yellow[700],
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(16),
            width: 160,
            height: 160,

            child: Center(
              child: Text(
                'Lorem ipsum',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.blue[900]),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            height: screenHeight * 0.5,
            width: screenWidth * 0.75,
            child: FlutterMap(
              options: MapOptions(
                  center: LatLng(44.657978, -1.145238),
                  zoom: 17,
                  maxZoom: 18,
                  keepAlive: true,
                  interactiveFlags: ~InteractiveFlag.rotate,
                  onTap: (tapP, LatLng location) => handleTap(location)),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                PolylineLayer(
                  polylineCulling: false,
                  polylines: [
                    Polyline(
                      points: [
                        LatLng(44.657978, -1.145238),
                        LatLng(44.759978, -1.145438),
                        LatLng(44.658968, -1.345738),
                      ],
                      color: Colors.orangeAccent,
                      strokeWidth: 5,
                      isDotted: true,
                    ),
                  ],
                ),
                // This Layer need to be the last to be able to remove markers
                MarkerLayer(
                  markers: _markers,
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            height: screenHeight * 0.5,
            width: screenWidth * 0.75,
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(45.657978, -1.145238),
                zoom: 10,
                maxZoom: 18,
                keepAlive: true,
                interactiveFlags: ~InteractiveFlag.rotate,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            height: screenHeight * 0.5,
            width: screenWidth * 0.75,
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(45.657978, -0.145238),
                zoom: 10,
                maxZoom: 18,
                keepAlive: true,
                interactiveFlags: ~InteractiveFlag.rotate,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            height: screenHeight * 0.5,
            width: screenWidth * 0.75,
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(44.657978, -0.145238),
                zoom: 10,
                maxZoom: 18,
                keepAlive: true,
                interactiveFlags: ~InteractiveFlag.rotate,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            height: screenHeight * 0.5,
            width: screenWidth * 0.75,
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(42.657978, -0.145238),
                zoom: 10,
                maxZoom: 18,
                keepAlive: true,
                interactiveFlags: ~InteractiveFlag.rotate,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
