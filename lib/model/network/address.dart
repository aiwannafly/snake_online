import 'dart:io';
import 'package:quiver/core.dart';

class Address {
  InternetAddress internetAddress;
  int port;

  Address({required this.internetAddress, required this.port});

  @override
  bool operator ==(other) => other is Address
      && internetAddress.address == other.internetAddress.address && port == other.port;

  @override
  int get hashCode => hash2(internetAddress.address.hashCode, port.hashCode);
}
