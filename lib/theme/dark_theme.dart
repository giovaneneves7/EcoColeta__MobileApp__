import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ecocoleta/util/app_constants.dart';

ThemeData dark({Color color = const Color(0xFF0e6b4f)}) => ThemeData(

	fontFamily: AppConstants.fontFamily,
	primaryColor: color,
	secondaryHeaderColor: const Color(0xFF009f67),
	brightness: Brightness.dark,
	
);