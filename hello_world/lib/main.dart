import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mi Perfil', style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.people, color: Colors.green),
              Text(
                'Deiby Jimenez',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('ADSO'),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[100],
                  foregroundColor: Colors.purple[900],
                ),
                onPressed: () {},
                child: Text('Ver Perfil'),
              )
            ],
          ),
        ),

      ),
    ),
  );
}
