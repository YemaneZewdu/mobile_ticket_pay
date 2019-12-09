import 'package:flutter/material.dart';
import 'package:mobile_ticket_pay/model/ticket_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class TicketDetailScreen extends StatefulWidget {
  final TicketModel _ticketModel;

  TicketDetailScreen(this._ticketModel);

  @override
  _TicketDetailScreenState createState() => _TicketDetailScreenState();
}

class _TicketDetailScreenState extends State<TicketDetailScreen> {
  GoogleMapController mapController;

  // marker
  Marker ticketLocationMarker = Marker(
    markerId: MarkerId('marker1'),
    draggable: false,
    position: LatLng(38.871768, -76.96860599999999),
  );

  _launchMaps() async {
    String googleUrl = 'comgooglemaps://?center=${40.7128},${-74.0060}';
    //String appleUrl =
    //   'https://maps.apple.com/?sll=${trip.origLocationObj.lat},${trip.origLocationObj.lon}';
    if (await canLaunch("comgooglemaps://")) {
      print('launching com googleUrl');
      await launch(googleUrl);
    }
//    else if (await canLaunch(appleUrl)) {
//      print('launching apple url');
//      await launch(appleUrl);
//    }
    else {
      throw 'Could not launch url';
    }
  }

  // custom widget method for returning ticket details
Widget ticketDetails (String title, String description){
    return Padding (
      padding: const EdgeInsets.only(bottom:8.0),
      child:Row(
        children: <Widget>[
          Text(
            title + ": " + description,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ) ,
    );
}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget._ticketModel.location),
        ),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Card(
                    //tag: widget._ticketModel.location.toString(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        ticketDetails("Reason", widget._ticketModel.violation.toString()),
                        ticketDetails("Location", widget._ticketModel.location.toString()),
                        ticketDetails("Payment",  "\$" + "${widget._ticketModel.fee}"),
                      ],
                    ),
                  ),
                )
              ],
            ),

            // contains google map view
            Center(
              child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(38.871768, -76.96860599999999),
                    zoom: 15.0,
                  ),
                  markers: {ticketLocationMarker},
                ),
              ),
            ),

            // contains two buttons
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      print('Pay button tapped');
                    },
                    padding: const EdgeInsets.all(8.0),
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Text(
                      'Pay',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      print('Cancel button tapped');
                    },
                    padding: const EdgeInsets.all(8.0),
                    textColor: Colors.white,
                    color: Colors.red,
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
