import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position position;

  @override
  void initState() {
    _getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:  AppBar(
        title: Text('Prueba'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              child: Icon(Icons.location_on),
              onPressed: _getLocation,
            ),
            SizedBox(height: 10,),
            Text('Altitud: ${position.longitude}'), //sobre eje x
            SizedBox(height: 10,),
            Text('Latitud: ${position.latitude}'), //sobre eje y
          ],
        ),

      ),

    );
  }

  _getLocation() async {
    position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print('location: ${position.longitude}, ${position.latitude}');
    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print("${first.featureName} : ${first.addressLine}");
  }

}

