 import 'package:flutter/material.dart';

Padding costum_container(BuildContext context) {

  var icon;
   
    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.deepPurple[900],
                        ),
                      ),
                    );
  }