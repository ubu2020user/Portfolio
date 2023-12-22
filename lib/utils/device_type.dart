import 'package:flutter/cupertino.dart';

enum DeviceType { Phone, Tablet }

bool isDeviceTypePhone(BuildContext context) => getDeviceType(context) == DeviceType.Phone;

DeviceType getDeviceType(BuildContext context) {
  return MediaQuery.of(context).size.shortestSide < 550 ? DeviceType.Phone : DeviceType.Tablet;
}