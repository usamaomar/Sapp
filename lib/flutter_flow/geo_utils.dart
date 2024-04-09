import 'dart:math';

class GeoUtils {
  static const double earthRadius = 6371000; // in meters

  static double degreesToRadians(double degrees) {
    return degrees * (pi / 180);
  }

  static double calculateDistance(double lat1, double lng1, double lat2, double lng2) {
    double dLat = degreesToRadians(lat2 - lat1);
    double dLng = degreesToRadians(lng2 - lng1);
    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(degreesToRadians(lat1)) * cos(degreesToRadians(lat2)) * sin(dLng / 2) * sin(dLng / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    double distance = earthRadius * c;
    return distance;
  }

  static bool isWithinRadius(double lat1, double lng1, double lat2, double lng2, double radius) {
    double distance = calculateDistance(lat1, lng1, lat2, lng2);
    return distance <= radius;
  }
}