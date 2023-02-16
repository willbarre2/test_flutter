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
      print('hello');
    }

    void handleTap(LatLng latLng) {
      setState(() {
        _markers.add(
          Marker(
              width: 40.0,
              height: 40.0,
              point: latLng,
              builder: (ctx) => ElevatedButton(
                    onPressed: () {
                      handlePressed(latLng);
                    },
                    child: Icon(Icons.sailing, size: 40, color: Colors.green),
                  )),
        );
      });
    }

    return ListView(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            height: screenHeight * 0.5,
            width: screenWidth * 0.95,
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
                MarkerLayer(
                  markers: _markers,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
