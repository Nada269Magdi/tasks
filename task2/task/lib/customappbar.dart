import 'package:flutter/material.dart';

class Customappbar extends StatelessWidget {
  const Customappbar({super.key});

  @override
  Widget build(BuildContext context) {
    
    double monthlyIncome = 5000;
    double remaining = 2600;
    double used = monthlyIncome - remaining;
    double percentUsed = used / monthlyIncome;
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[700],
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Icon(Icons.nightlight_round, color: Colors.white),
          ),
          SizedBox(height: 10),
          Text(
            'Smart Bills & Budget',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Monthly Income', style: TextStyle(color: Colors.white)),
                  Text('L.E 5,000',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Remaining', style: TextStyle(color: Colors.white)),
                  Text('L.E 2,600',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              minHeight: 12,
              value: percentUsed,
              backgroundColor: Colors.blue[100],
              valueColor: AlwaysStoppedAnimation<Color>(
                percentUsed < 0.5 ? Colors.green : Colors.orange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}