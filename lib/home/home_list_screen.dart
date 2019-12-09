import 'package:flutter/material.dart';
import 'package:mobile_ticket_pay/ticket_detail_screen/ticket.dart';
import 'package:mobile_ticket_pay/model/ticket_model.dart';

class HomeListScreen extends StatelessWidget {
  final List<TicketModel> _ticketList = [
    TicketModel("14th St NW & Pebody", 50.00, "Red light"),
    TicketModel("17th St NW & Pebody", 50.00, "Speeding"),
    TicketModel("Missouri Avenue", 50.00, "Stop sign violation"),
    TicketModel("Red light camera @ 14th St", 150.00, "Red light"),
    TicketModel("Stop sign viloation @ Delafield", 5000.00, "Red light"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: _ticketList.map((ticket) => Ticket(ticket)).toList(),
      ),
    );
  }
}
