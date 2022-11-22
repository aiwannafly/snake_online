class Util {
  static List<int> parseIPv4Address(String host) {
    void error(String msg) {
      throw FormatException('Illegal IPv4 address, $msg');
    }

    var bytes = host.split('.');
    if (bytes.length != 4) {
      error('IPv4 address should contain exactly 4 parts');
    }
    return bytes.map((byteString) {
      int byte = int.parse(byteString);
      if (byte < 0 || byte > 255) {
        error('each part must be in the range of `0..255`');
      }
      return byte;
    }).toList();
  }
}
