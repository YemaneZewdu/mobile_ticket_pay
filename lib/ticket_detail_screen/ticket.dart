import 'package:flutter/material.dart';
import 'package:mobile_ticket_pay/ticket_detail_screen/ticket_detail_screen.dart';
import 'package:mobile_ticket_pay/model/ticket_model.dart';

class Ticket extends StatelessWidget {
  final TicketModel ticketModel;

  Ticket (this.ticketModel);
 // const Ticket({Key key, this.ticketModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context)=>TicketDetailScreen(ticketModel))),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Hero(
              tag: ticketModel.location.toString(),
              child: Text(ticketModel.location),
            ),
            Expanded(
              child: Text("${ticketModel.fee} dollars") ,
            )
          ],
        ),
      ),
    );
  }
}
