import 'package:flutter/material.dart';
import 'dart:ui';

const primaryColor = const Color(0xFFbbdefb);
const primaryLight = const Color(0xFFbbdefb);
const primaryDark = const Color(0xFFbbdefb);

const secondaryColor = const Color(0xFFbbdefb);
const secondaryLight = const Color(0xFFbbdefb);
const secondaryDark = const Color(0xFFbbdefb);

const Color gradientStart = const Color(0xFFFFFFFF);
const Color gradientEnd = const Color(0xFFbbdefb);

const primaryGradient = const LinearGradient(
  colors: const [gradientStart, gradientStart, gradientEnd],
  stops: const [0.0,0.5 ,1.0],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const chatBubbleGradient = const LinearGradient(
  colors: const [Color(0xFF90caf9), Color(0xFFbbdefb)],
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
);

const chatBubbleGradient2 = const LinearGradient(
  colors: const [Color(0xFFf4e3e3), Color(0xFFf4e3e3)],
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
);
