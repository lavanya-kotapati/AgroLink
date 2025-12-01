import 'package:flutter/material.dart';

// Device specifications
const int _iPadDesignWidth = 1366;
const int _iPadDesignHeight = 1024;

// const int _iPadDesignWidth = 1333;
// const int _iPadDesignHeight = 752;

// Breakpoints
const double _mobileBreakpoint = 600;
const double _tabletBreakpoint = 900;
const double _iPadBreakpoint = 1366;

// Scale factors
const double _mobileLandscapeScale = 0.85;
const double _tabletLandscapeScale = 1.0;
const double _iPadLandscapeScale = 1.2;

// Device type detection
DeviceType _getDeviceType(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  double aspectRatio = width / height;

  if (width >= _iPadBreakpoint ||
      (width >= _tabletBreakpoint && aspectRatio >= 1.3)) {
    return DeviceType.iPadPro;
  } else if (width >= _tabletBreakpoint ||
      (width >= _mobileBreakpoint && aspectRatio >= 1.3)) {
    return DeviceType.tablet;
  }
  return DeviceType.mobile;
}

double _getScaleFactor(BuildContext context) {
  DeviceType deviceType = _getDeviceType(context);
  bool isLandscape =
      MediaQuery.of(context).orientation == Orientation.landscape;

  if (!isLandscape) return 1.0;

  switch (deviceType) {
    case DeviceType.mobile:
      return _mobileLandscapeScale;
    case DeviceType.tablet:
      return _tabletLandscapeScale;
    case DeviceType.iPadPro:
      return _iPadLandscapeScale;
  }
}

// Global functions for easy usage
double buildWidth(BuildContext context, double width) {
  return width *
      MediaQuery.of(context).size.width /
      _iPadDesignWidth; // Apply it here
}

double buildHeight(BuildContext context, double height) {
  return height *
      MediaQuery.of(context).size.height /
      _iPadDesignHeight; // Apply it here
}

double buildFontSize(BuildContext context, double size) {
  double scaleFactor = _getScaleFactor(context);
  return size *
      (MediaQuery.of(context).size.width / _iPadDesignWidth) *
      scaleFactor;
}

double buildSpacing(BuildContext context, double value) {
  return value * MediaQuery.of(context).size.width / _iPadDesignWidth;
}

double buildImageSize(BuildContext context, double size) {
  double scaleFactor = _getScaleFactor(context);
  return size *
      (MediaQuery.of(context).size.width / _iPadDesignWidth) *
      scaleFactor;
}

double buildGap(BuildContext context, double gapSize) {
  return gapSize * MediaQuery.of(context).size.width / _iPadDesignWidth;
}

EdgeInsets buildSafePadding(BuildContext context) {
  return EdgeInsets.symmetric(
      horizontal: buildWidth(context, 24), vertical: buildHeight(context, 16));
}

double getScreenRatio(BuildContext context) {
  return MediaQuery.of(context).size.width / MediaQuery.of(context).size.height;
}

// Helper functions for device checks
bool isIPad(BuildContext context) =>
    _getDeviceType(context) == DeviceType.iPadPro;
bool isTablet(BuildContext context) =>
    _getDeviceType(context) == DeviceType.tablet;
bool isMobile(BuildContext context) =>
    _getDeviceType(context) == DeviceType.mobile;
bool isLandscape(BuildContext context) =>
    MediaQuery.of(context).orientation == Orientation.landscape;

enum DeviceType { mobile, tablet, iPadPro }

Route customPageRoute(Widget page) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 500),
    reverseTransitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}
