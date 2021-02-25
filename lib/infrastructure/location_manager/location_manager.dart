import 'package:communitygetandpost/domain/value_object/location.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:geolocator/geolocator.dart';

class LocationManager {
  Future<Location> getLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    final placeMarks = await geocoding.GeocodingPlatform.instance
        .placemarkFromCoordinates(position.latitude, position.longitude);
    final placeMark = placeMarks.first;
    print(placeMark.country);
    return Location(position.latitude, position.longitude, placeMark.country,
        placeMark.administrativeArea, placeMark.locality);
  }
}
