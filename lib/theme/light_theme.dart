import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ecocoleta/util/app_constants.dart';

ThemeData light({Color color = const Color(0xFF71be78)}) => ThemeData(

	fontFamily: AppConstants.fontFamily,
	primaryColor: color,
	secondaryHeaderColor: const Color(0xFFf5f5f5),
	disabledColor: const Color(0xFFb6b6b6),
	brightness: Brightness.light,
	cardColor: Colors.white,	
);