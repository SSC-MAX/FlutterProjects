/*
 * @Descripttion: 
 * @version: 
 * @Author: sc
 * @Date: 2024-07-04 14:13:00
 */
import 'package:flutter/material.dart';

OverlayEntry buildOverlayWindow() => OverlayEntry(
      builder: (BuildContext context) => Positioned(
        top: 50.0,
        left: 20.0,
        right: 20.0,
        child: Container(
          width: MediaQuery.of(context).size.width-40,
          height: 150.0,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.red),
        ),
      ),
    );
